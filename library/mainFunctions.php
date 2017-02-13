<?php

/**
 * Основые функции
 */

/**
 * Формирование запрашиваемой страницы
 * 
 * @param string $controllerName название контроллера
 * @param string $actionName название функции обработки страницы
 */
function loadPage($smarty, $controllerName, $actionName = 'index')
{
    include_once PathPrefix . $controllerName . PathPostfix;
    
    $function = $actionName . 'Action';
    $function($smarty);
}

/**
 * Загрузка шаблона
 * 
 * @param object $smarty объект шаблоизатора
 * @param string $templateName название файла шаблона
 */
function loadTemplate($smarty, $templateName)
{
    $smarty->display($templateName . TemplatePostfix);
}

/**
 * Фукция отладки. Останавливает работу программы, выводя значеие переменной
 * $value
 * 
 * @param variant $value переменная для вывода её на страницу
 */
function d($value = null, $die = 1)
{
    function debugOut($a)
    {
        echo '<br /><b>' . basename( $a['file'] ) . '</b>'
            . "&nbsp;<font color='red'>({$a['line']})</font>"
            . "&nbsp;<font color='green'>({$a['function']})</font>"
            . "&nbsp; -- " . dirname( $a['file'] );
    }
    echo '<pre>';
        $trace = debug_backtrace();
        //var_dump($trace);
        array_walk($trace, 'debugOut');
        echo "\n\n";
        //var_dump($value);
        print_r($value);
        //echo $value;
    echo '</pre>';
    
    if($die) die;
}

/**
 * Преобразование результата работы функции выборки в ассоциативный массив
 * 
 * @param recordset $rs набор строк - результат работы SELECT
 * @return array
 */
function createSmartyRsArray($rs)
{
    if (! $rs) return false;
    
    $smartyRs = array();
    while ($row = mysql_fetch_assoc($rs)) {
        $smartyRs[] = $row;
    }
    
    return $smartyRs;
}

/**
 * Редирект
 * 
 * @param string $url адрес для перенаправления
 */
function redirect($url)
{
    if (! $url) $url = '/';
    header("Location: $url");
    exit;
}

function maxSize()
{
    $maxSize = 2 * 1024 * 1024;
    
    if ($_FILES['filename']['size'] > $maxSize) {
        return true;
    }
    return false;
}

function extens()
{
    // получаем расширение загружаемого файла
    $ext = pathinfo($_FILES['filename']['name'], PATHINFO_EXTENSION);
    
    return $ext;
}

function fpath($localPath)
{
    $path = $_SERVER['DOCUMENT_ROOT'] . $localPath;
    if (!file_exists($path)) {
        mkdir($path);
    }
    
    return $path;
}

function uploadFile($localFilename, $localPath = '/upload/')
{
    // получаем расширение загружаемого файла
    $ext = extens();
    
    $pathInfo = pathinfo($localFilename);
    
    if ($ext != $pathInfo['extension'])
        return false;

    // создаём имя файла
    $newFileName = $pathInfo['filename'] . '_' . time() . '.' . $pathInfo['extension'];
    $path = fpath($localPath);

    // Загружен ли файл
    if (is_uploaded_file($_FILES['filename']['tmp_name'])) {
        // Проверяем размер файла
        $maxSize = maxSize();
        if ($maxSize) {
            die('Размер файла превышает 2 мегабайта');
        }
        // Если файл загружен, то перемещаем его из временной директории в конечную
        $res = move_uploaded_file($_FILES['filename']['tmp_name'], $path . $newFileName);
        return ($res == true) ? $newFileName : false;
    } else {
        return false;
    }
}

function thumb($filename, $thumbFilename, $ext)
{
    // тип содержимого
    header('Content-Type: image/'.$ext);

    // получение нового размера
    list($width, $height) = getimagesize($filename.'.'.$ext);
    $newWidth = 212;
    $newHeight = $newWidth * $height / $width;

    // загрузка
    $thumb = imagecreatetruecolor($newWidth, $newHeight);
    
    if ($ext == 'JPG' || $ext == 'jpg' || $ext == 'jpeg') {
        $source = imagecreatefromjpeg($filename.'.'.$ext);
    } elseif ($ext == 'png') {
        $source = imagecreatefrompng($filename.'.'.$ext);
    } elseif ($ext == 'gif') {
        $source = imagecreatefromgif($filename.'.'.$ext);
    }

    // изменение размера
    imagecopyresized($thumb, $source, 0, 0, 0, 0, $newWidth, $newHeight, $width, $height);

    // вывод
    if ($ext == 'JPG' || $ext == 'jpg' || $ext == 'jpeg') {
        imagejpeg($thumb, $thumbFilename.'.'.$ext);
    } elseif ($ext == 'png') {
        imagepng($thumb, $thumbFilename.'.'.$ext);
    } elseif ($ext == 'gif') {
        imagegif($thumb, $thumbFilename.'.'.$ext);
    }

    imagedestroy($thumb);
}