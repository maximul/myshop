<?php

/**
 * ProductController.php
 * 
 * Котроллер страницы товара (/product/1)
 */

// подключаем модели
include_once '../models/CategoriesModel.php';
include_once '../models/ProductsModel.php';

/**
 * Формирование страницы товара
 * 
 * @param object $smarty шаблонизатор
 */
function indexAction($smarty) {
    $itemId = isset($_GET['id']) ? $_GET['id'] : null;
    if ($itemId == null) exit();
    
    // Получить данные продукта
    $rsProduct = getProductById($itemId);
    $rsProduct['description'] = html_entity_decode($rsProduct['description'], ENT_COMPAT | ENT_HTML401, "UTF-8");
    
    // Получить все категории
    $rsCategories = getAllMainCatsWithChildren();
    
    $smarty->assign('itemInCart', 0);
    if (in_array($itemId, $_SESSION['cart'])) {
        $smarty->assign('itemInCart', 1);
    }
    // d($rsCategories);
    $smarty->assign('pageTitle', '');
    $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('rsProduct', $rsProduct);
    
    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'product');
    loadTemplate($smarty, 'footer');
}