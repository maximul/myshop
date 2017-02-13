<?php

/**
 * Файл настроек
 */

//> Константы для обр-я к контр-рам
define('PathPrefix', '../controllers/');
define('PathPostfix', 'Controller.php');
//<

//> используемый шаблон
//$template = 'default';
$template = 'texturia';
$templateAdmin = 'admin';

// пути к файлам шаблонов (*.tpl)
define('TemplatePrefix', "../views/$template/");
define('TemplateAdminPrefix', "../views/$templateAdmin/");
define('TemplatePostfix', '.tpl');

// пути к файлам шаблонов в вебпространчтве
define('TemplateWebPath', "/templates/$template/");
define('TemplateAdminWebPath', "/templates/$templateAdmin/");
//<

//> Инициализация шаблонизатора Smarty
// put full path to Smarty.class.php
require('../library/Smarty/libs/Smarty.class.php');
$smarty = new Smarty();

$smarty->setTemplateDir(TemplatePrefix);
$smarty->setCompileDir('../tmp/smarty/templates_c');
$smarty->setCacheDir('../tmp/smarty/cache');
$smarty->setConfigDir('../library/Smarty/configs');

$smarty->assign('templateWebPath', TemplateWebPath);
//<