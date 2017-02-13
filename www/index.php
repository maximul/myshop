<?php
session_start(); // стартуем сессию

// если в сессии нет массива корзины, то создаём его
if (! isset($_SESSION['cart'])) {
    $_SESSION['cart'] = array();
}

include_once '../config/config.php';        // Иниц. настроек
include_once '../config/db.php';            // Иниц. БД
include_once '../library/mainFunctions.php'; // Осн. ф-ции

// опред. с каким контр-ром будем работать
$controllerName = isset($_GET['controller']) ? ucfirst($_GET['controller']) : 'Index';

// опред. с какой ф-цией будем работать
$actionName = isset($_GET['action']) ? $_GET['action'] : 'index';

// если в сессии есть данные об авторизированном пользователе, то передаём
// их в шаблон
if (isset($_SESSION['user'])) {
    $smarty->assign('arUser', $_SESSION['user']);
}

// иниц-ем переменную шаблон-ра кол-ва эл-тов в корзине
$smarty->assign('cartCntItems', count($_SESSION['cart']));

loadPage($smarty, $controllerName, $actionName);