<?php /* Smarty version Smarty-3.1-DEV, created on 2016-07-30 20:11:18
         compiled from "..\views\default\header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:28238577ea3e451f6b7-01232175%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8a8477abf4bfe3827b2b80cb8b8f9ef5ff937b76' => 
    array (
      0 => '..\\views\\default\\header.tpl',
      1 => 1469901252,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '28238577ea3e451f6b7-01232175',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1-DEV',
  'unifunc' => 'content_577ea3e45561c2_57330013',
  'variables' => 
  array (
    'pageTitle' => 0,
    'templateWebPath' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_577ea3e45561c2_57330013')) {function content_577ea3e45561c2_57330013($_smarty_tpl) {?><!DOCTYPE html>
<html>
    <head>
            <title><?php echo $_smarty_tpl->tpl_vars['pageTitle']->value;?>
</title>
        <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['templateWebPath']->value;?>
css/main.css" type="text/css" />
        <script type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="/js/main.js"></script>
    </head>
    <body>
        <div id="header">
            <h1>my shop - интернет магазин</h1>
        </div>

        <?php echo $_smarty_tpl->getSubTemplate ('leftcolumn.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>


        <div id="centerColumn"><?php }} ?>