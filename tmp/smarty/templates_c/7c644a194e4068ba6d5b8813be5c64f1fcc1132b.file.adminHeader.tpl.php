<?php /* Smarty version Smarty-3.1-DEV, created on 2016-07-30 20:13:59
         compiled from "..\views\admin\adminHeader.tpl" */ ?>
<?php /*%%SmartyHeaderCode:26789579ceddd7168f4-24729394%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7c644a194e4068ba6d5b8813be5c64f1fcc1132b' => 
    array (
      0 => '..\\views\\admin\\adminHeader.tpl',
      1 => 1469902333,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '26789579ceddd7168f4-24729394',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1-DEV',
  'unifunc' => 'content_579ceddd749587_63039973',
  'variables' => 
  array (
    'pageTitle' => 0,
    'templateWebPath' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_579ceddd749587_63039973')) {function content_579ceddd749587_63039973($_smarty_tpl) {?>
<!DOCTYPE html>
<html>
    <head>
            <title><?php echo $_smarty_tpl->tpl_vars['pageTitle']->value;?>
</title>
        <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['templateWebPath']->value;?>
css/main.css" type="text/css" />
        <script type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['templateWebPath']->value;?>
js/admin.js"></script>
    </head>
    <body>
        <div id="header">
            <h1>Управление сайтом</h1>
        </div>

        <?php echo $_smarty_tpl->getSubTemplate ('adminLeftcolumn.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>


        <div id="centerColumn"><?php }} ?>