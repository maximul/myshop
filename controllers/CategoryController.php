<?php

/**
 * CategoryController.php
 * 
 * Котроллер страницы категории (/category/1)
 */

// подключаем модели
include_once '../models/CategoriesModel.php';
include_once '../models/ProductsModel.php';

/**
 * Формирование страницы категории
 * 
 * @param object $smarty шаблонизатор
 */
function indexAction($smarty) {
    $catId = isset($_GET['id']) ? $_GET['id'] : null;
    if ($catId == null) exit();
    
    $rsProducts = null;
    $rsChildCats = null;
    $comment = null;
    $rsCategory = getCatById($catId);
    
    // Если главная категория, то показываем дочернии категория,
    // иначе показываем товар
    if ($rsCategory['parent_id'] == 0) {
        $rsChildCats = getChildrenForCat($catId);
        //$rsProducts = getProductsByCat($catId);
    } else {
        $rsProducts = getProductsByCat($catId);
        if ($rsProducts == null) $comment = 'Нет товаров!';
    }
    
    $rsCategories = getAllMainCatsWithChildren();

    $smarty->assign('pageTitle', 'Товары категории' . $rsCategory['name']);
    
    $smarty->assign('rsCategory', $rsCategory);
    $smarty->assign('rsProducts', $rsProducts);
    $smarty->assign('rsChildCats', $rsChildCats);
    $smarty->assign('comment', $comment);
    
    $smarty->assign('rsCategories', $rsCategories);
    
    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'category');
    loadTemplate($smarty, 'footer');
}