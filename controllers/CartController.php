<?php

/**
 * CartController.php
 * 
 * Котроллер работы с корзиной (/cart/)
 */

// подключаем модели
include_once '../models/CategoriesModel.php';
include_once '../models/ProductsModel.php';
include_once '../models/OrdersModel.php';
include_once '../models/PurchaseModel.php';

/**
 * Добавление продукта в корзину
 * 
 * @param integer id GET параметр - ID добавляемого продукта
 * @return json информация об операции (успех, кол-во элементов в корзине)
 */
function addtocartAction() {
    $itemId = isset($_GET['id']) ? intval($_GET['id']) : null;
    if (! $itemId) return false;
    
    $resData = array();
    
    // если зачение не найдено, то добавляем
    if (isset($_SESSION['cart']) && array_search($itemId, $_SESSION['cart']) === false) {
        $_SESSION['cart'][] = $itemId;
        $resData['cntItems'] = count($_SESSION['cart']);
        $resData['success'] = 1;
    } else {
        $resData['success'] = 0;
    }
    
    echo json_encode($resData);
}

/**
 * Удаление продукта из корзины
 * 
 * @param integer id GET параметр - ID удаляемого продукта
 * @return json информация об операции (успех, кол-во элементов в корзине)
 */
function removefromcartAction() {
    $itemId = isset($_GET['id']) ? intval($_GET['id']) : null;
    if (! $itemId) exit();
    
    $resData = array();
    $key = array_search($itemId, $_SESSION['cart']);
    if ($key !== false) {
        unset($_SESSION['cart'][$key]);
        $resData['cntItems'] = count($_SESSION['cart']);
        $resData['success'] = 1;
    } else {
        $resData['success'] = 0;
    }
    
    echo json_encode($resData);
}

/**
 * Формирование страницы корзины
 * 
 * @link /cart/
 */
function indexAction($smarty) {
    
    $itemsIds = isset($_SESSION['cart']) ? $_SESSION['cart'] : array();
    
    $rsCategories = getAllMainCatsWithChildren();
    $rsProducts = getProductsFromArray($itemsIds);
    
    $smarty->assign('pageTitle', 'Корзина');
    $smarty->assign('rsProducts', $rsProducts);
    $smarty->assign('rsCategories', $rsCategories);
    
    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'cart');
    loadTemplate($smarty, 'footer');
}

/**
 * Формирование страницы заказа
 * 
 */
function orderAction($smarty) {
    // получаем массив идентификаторов (ID) продуктов корзины
    $itemsIds = isset($_SESSION['cart']) ? $_SESSION['cart'] : null;
    // если корзина пуста, то редиректим корзину
    if (! $itemsIds) {
        redirect('/cart/');
        return;                
    } 
    
    // получаем из массива $_POST количество покупаемых товаров
    $itemsCnt = array();
    foreach ($itemsIds as $item) {
        // формируем ключ для массива $_POST
        $postVar = 'itemCnt_' . $item;
        // создаём элемент массива количества покупаемого товара
        // ключ массива - ID товара, значение массива - количество товара
        // $itemsCnt[1] = 3; товар с ID == 1 покупают 3 штуки
        $itemsCnt[$item] = isset($_POST[$postVar]) ? $_POST[$postVar] : null;
    }
    
    // получаем список продуктов по массиву корзины
    $rsProducts = getProductsFromArray($itemsIds);
    
    // добавляем каждому продукту доп. поле
    // "realPrice" = кол-во прод-в * на цену продукта
    // "cnt" = кол-во покуп. товара
    
    // &$item - для того, чтобы при изменении переменной $item
    // менялся и эл-т массива $rsProducts
    $i = 0;
    foreach ($rsProducts as &$item) {
        $item['cnt'] = isset($itemsCnt[$item['id']]) ? $itemsCnt[$item['id']] : 0;
        if ($item['cnt']) {
            $item['realPrice'] = $item['cnt'] * $item['price'];
        } else {
            // если вдруг получилось так, что товар в корзине есть, а количество == 0,
            // то удаляем этот товар
            unset($rsProducts[$i]);
        }
        $i++;
    }
    
    if (! $rsProducts) {
        echo 'Корзина пуста';
        return;
    }
    
    // полученный массив покупаемых товаров помещаем в сессионную переменную
    $_SESSION['saleCart'] = $rsProducts;
    
    // получаем список категорий для меню
    $rsCategories = getAllMainCatsWithChildren();
    
    // hideLoginBox переменная - флаг для того, чтобы спрятать блоки логина и регистрации
    // в боковой панели
    if (! isset($_SESSION['user'])) {
        $smarty->assign('hideLoginBox', 1);
    }

    $smarty->assign('pageTitle', 'Заказ');
    $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('rsProducts', $rsProducts);
    
    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'order');
    loadTemplate($smarty, 'footer');
}

/**
 * AJAX функция сохранения заказа
 * 
 * @param array $_SESSION['saleCart'] массив покупаемых продуктов
 * @return json информация о рез-те выполнения
 */
function saveorderAction() {
    // получаем массив покупаемых товаров
    $cart = isset($_SESSION['saleCart']) ? $_SESSION['saleCart'] : null;
    // если корзиа пуста, то формируем ответ с ошибкой, отдаём его в формате
    // json и выходим из ф-ции
    if (! $cart) {
        $resData['success'] = 0;
        $resData['message'] = 'Нет товаров для заказа';
        echo json_encode($resData);
        return;
    }
    
    $name    = $_POST['name'];
    $phone   = $_POST['phone'];
    $address = $_POST['address'];
    
    // создаём новый заказ и получаем его ID
    $orderId = makeNewOrder($name, $phone, $address);
    
    // если заказ не создан, то выдаём ошибку
    if (! $orderId) {
        $resData['success'] = 0;
        $resData['message'] = 'Ошибка создания заказа';
        echo json_encode($resData);
        return;
    }
    
    // сохраняем товары для созданного заказа
    $res = setPurchaseForOrder($orderId, $cart);
    
    // если успешно, то формируем ответ, удаляем переменные корзины
    if ($res) {
        $resData['success'] = 1;
        $resData['message'] = 'Заказ сохранён';
        unset($_SESSION['saleCart']);
        unset($_SESSION['cart']);
    } else {
        $resData['success'] = 0;
        $resData['message'] = 'Ошибка внесения данных для заказа № ' . $orderId;
    }
    
    echo json_encode($resData);
}