<?php

/**
 * Иициализация подключеия к БД
 */

$dblocation = "127.0.0.1";
$dbname = "myshop";
$dbuser = "root";
$dbpasswd = "1";

// Соединяемся с БД
$db = mysql_connect($dblocation, $dbuser, $dbpasswd);

if(! $db){
    echo 'Ошибка доступа к MySql';
    exit();
}

// Устан. кодировку по умолчаию
mysql_set_charset('utf8');

if( ! mysql_select_db($dbname, $db) ){
    echo 'Ошибка доступа к БД';
    exit();
}