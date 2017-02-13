<?php

/**
 * AdminController.php
 * 
 * Контроллер бэкенда сайта (/admin/)
 * 
 */
// подключаем модели
include_once '../models/CategoriesModel.php';
include_once '../models/ProductsModel.php';
include_once '../models/OrdersModel.php';
include_once '../models/PurchaseModel.php';

$smarty->setTemplateDir(TemplateAdminPrefix);
$smarty->assign('templateWebPath', TemplateAdminWebPath);

/**
 * Главная страница Админа
 * 
 * @param type $smarty
 */
function indexAction($smarty) {

    $rsCategories = getAllMainCategories();

    $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('pageTitle', 'Управление сайтом');

    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'admin');
    loadTemplate($smarty, 'adminFooter');
}

/**
 * Добавление новой категории
 * 
 * @return type
 */
function addnewcatAction() {

    $catName = $_POST['newCategoryName'];
    $catParentId = $_POST['generalCatId'];

    $res = insertCat($catName, $catParentId);
    if ($res) {
        $resData['success'] = 1;
        $resData['message'] = 'Категория добавлена';
    } else {
        $resData['success'] = 0;
        $resData['message'] = 'Ошибка добавления категории';
    }

    echo json_encode($resData);
    return;
}

/**
 * Страница управления категориями
 * 
 * @param type $smarty
 */
function categoryAction($smarty) {
    $rsCategories = getAllCategories();
    $rsMainCategories = getAllMainCategories();

    $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('rsMainCategories', $rsMainCategories);
    $smarty->assign('pageTitle', 'Управление сайтом');

    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'adminCategory');
    loadTemplate($smarty, 'adminFooter');
}

/**
 * Обновлеие данных категории
 * 
 * @return type
 */
function updatecategoryAction() {
    $itemId = $_POST['itemId'];
    $parentId = $_POST['parentId'];
    $newName = $_POST['newName'];

    $res = updateCategoryData($itemId, $parentId, $newName);

    if ($res) {
        $resData['success'] = 1;
        $resData['message'] = 'Категория обновлена';
    } else {
        $resData['success'] = 0;
        $resData['message'] = 'Ошибка изменения данных категории';
    }

    echo json_encode($resData);
    return;
}

/**
 * Страница управления товарами
 * 
 * @param type $smarty
 */
function productsAction($smarty) {
    $rsCategories = getAllCategories();
    $rsProducts = getProducts();
    for ($i = 0; $i < count($rsProducts); $i++) {
        $rsProducts[$i]['description'] = html_entity_decode($rsProducts[$i]['description'], ENT_COMPAT | ENT_HTML401, "UTF-8");
    }

    $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('rsProducts', $rsProducts);
    $smarty->assign('pageTitle', 'Управление сайтом');

    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'adminProducts');
    loadTemplate($smarty, 'adminFooter');
}

function addproductAction() {
    $itemName = $_POST['itemName'];
    $itemPrice = $_POST['itemPrice'];
    $itemDesc = htmlentities($_POST['itemDesc'], ENT_COMPAT | ENT_HTML401, "UTF-8");
    $itemCat = $_POST['itemCatId'];

    $res = insertProduct($itemName, $itemPrice, $itemDesc, $itemCat);

    if ($res) {
        $resData['success'] = 1;
        $resData['message'] = 'Изменения успешно внесены';
    } else {
        $resData['success'] = 0;
        $resData['message'] = 'Ошибка изменения данных';
    }

    echo json_encode($resData);
    return;
}

function updateproductAction() {
    $itemId = $_POST['itemId'];
    $itemName = $_POST['itemName'];
    $itemPrice = $_POST['itemPrice'];
    $itemStatus = $_POST['itemStatus'];
    $itemDesc = htmlentities($_POST['itemDesc'], ENT_COMPAT | ENT_HTML401, "UTF-8");
    $itemCat = $_POST['itemCatId'];
    
    $res = updateProduct($itemId, $itemName, $itemPrice, $itemStatus, $itemDesc, $itemCat);

    if ($res) {
        $resData['success'] = 1;
        $resData['message'] = 'Изменения успешно внесены';
    } else {
        $resData['success'] = 0;
        $resData['message'] = 'Ошибка изменения данных';
    }

    echo json_encode($resData);
    return;
}

function uploadAction() {

    $itemId = $_POST['itemId'];
    
    // получаем расширение загружаемого файла
    $ext = extens();
    
    // создаём имя файла
    $newFileName = $itemId . '.' . $ext;
    $localPath = '/images/products/';
    $path = fpath($localPath);
    
    // Загружен ли файл
    if (is_uploaded_file($_FILES['filename']['tmp_name'])) {
        
        // Проверяем размер файла
        $maxSize = maxSize();
        if ($maxSize) {
            die('Размер файла превышает 2 мегабайта');
        }
        
        if ($ext != 'JPG' && $ext != 'jpg' && $ext != 'jpeg' && $ext != 'png' && $ext != 'gif') {
            die('Вы выбрали неверый тип файла!');
        }

        // Если файл загружен, то перемещаем его из временной директории в конечную
        $res = move_uploaded_file($_FILES['filename']['tmp_name'], $path . $newFileName);
        if ($res) {
            $res = updateProductImage($itemId, $newFileName);
            if ($res) {
                // создаём имя миниатюры файла
                $path_th = fpath($localPath.'th/');
                thumb($path.$itemId, $path_th.$itemId, $ext);
                redirect('/admin/products/');
            }
        }
    } else {
        echo "Ошибка загрузки файла";
    }
}

function ordersAction($smarty) {

    $rsOrders = getOrders();

    $smarty->assign('rsOrders', $rsOrders);
    $smarty->assign('pageTitle', 'Заказы');

    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'adminOrders');
    loadTemplate($smarty, 'adminFooter');
}

function setorderstatusAction() {
    $itemId = $_POST['itemId'];
    $status = $_POST['status'];

    $res = updateOrderSatus($itemId, $status);

    if ($res) {
        $resData['success'] = 1;
    } else {
        $resData['success'] = 0;
        $resData['message'] = 'Ошибка устаовки статуса';
    }

    echo json_encode($resData);
    return;
}

function setorderdatepaymentAction() {
    $itemId = $_POST['itemId'];
    $datePayment = $_POST['datePayment'];

    $res = updateOrderDatePayment($itemId, $datePayment);

    if ($res) {
        $resData['success'] = 1;
    } else {
        $resData['success'] = 0;
        $resData['message'] = 'Ошибка устаовки статуса';
    }

    echo json_encode($resData);
    return;
}

function createxmlAction() {
    $rsProducts = getProducts();

    $xml = new DOMDocument('1.0', 'utf-8');

    $xmlProducts = $xml->appendChild($xml->createElement('products'));

    foreach ($rsProducts as $product) {
        $xmlProduct = $xmlProducts->appendChild($xml->createElement('product'));
        foreach ($product as $key => $val) {
            $xmlName = $xmlProduct->appendChild($xml->createElement($key));
            $xmlName->appendChild($xml->createTextNode($val));
        }
    }

    $xml->save($_SERVER["DOCUMENT_ROOT"] . '/xml/products.xml');
    echo 'ok';
}

function loadformxmlAction() {
    $successUploadFilename = uploadFile('import_products.xml', '/xml/import/');
    
    if (!$successUploadFilename) {
        echo 'Ошибка загрузки файла';
        return;
    }

    $xmlFile = $_SERVER['DOCUMENT_ROOT'] . '/xml/import/' . $successUploadFilename;
    $xmlProducts = simplexml_load_file($xmlFile);
    
    $products = array();
    $i = 0;
    foreach ($xmlProducts as $product) {
        $products[$i]['name'] = htmlentities($product->name);
        $products[$i]['category_id'] = intval($product->category_id);
        $products[$i]['description'] = htmlentities($product->description, ENT_COMPAT | ENT_HTML401, "UTF-8");
        $products[$i]['price'] = intval($product->price);
        $products[$i]['status'] = intval($product->status);
        //$products[$i]['image'] = htmlentities($product->image);
        $i++;
    }
    
    $res = insertImportProducts($products);

    if ($res) {
        redirect('/admin/products/');
    }
}
