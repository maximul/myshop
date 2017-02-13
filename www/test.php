<?php

// файл и новый размер
$filename = $_SERVER['DOCUMENT_ROOT'] . '/images/products/20';
$ext = '.png';
//$percent = 0.5;

// тип содержимого
header('Content-Type: image/'.$ext);

// получение нового размера
list($width, $height) = getimagesize($filename.$ext);
//echo $width;die();
$newwidth = 212;
$newheight = $newwidth * $height / $width;

// загрузка
$thumb = imagecreatetruecolor($newwidth, $newheight);
switch ($ext) {
    case '.png': $source = imagecreatefrompng($filename.$ext);    break;
    case '.jpg': $source = imagecreatefromjpeg($filename.$ext);    break;
    case '.gif': $source = imagecreatefromgif($filename.$ext);    break;
}

// изменение размера
imagecopyresized($thumb, $source, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);

// вывод
switch ($ext) {
    case '.png': imagepng($thumb, $filename.'_thumb'.$ext);    break;
    case '.jpg': imagejpeg($thumb, $filename.'_thumb'.$ext);    break;
    case '.gif': imagegif($thumb, $filename.'_thumb'.$ext);    break;
}
imagedestroy($thumb);