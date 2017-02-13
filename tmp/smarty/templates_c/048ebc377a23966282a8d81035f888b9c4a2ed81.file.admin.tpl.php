<?php /* Smarty version Smarty-3.1-DEV, created on 2016-07-31 14:20:18
         compiled from "..\views\admin\admin.tpl" */ ?>
<?php /*%%SmartyHeaderCode:25003579cee67689820-73713422%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '048ebc377a23966282a8d81035f888b9c4a2ed81' => 
    array (
      0 => '..\\views\\admin\\admin.tpl',
      1 => 1469967608,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '25003579cee67689820-73713422',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1-DEV',
  'unifunc' => 'content_579cee67689824_52284990',
  'variables' => 
  array (
    'rsCategories' => 0,
    'item' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_579cee67689824_52284990')) {function content_579cee67689824_52284990($_smarty_tpl) {?><div id="blockNewCategory">
    Новая категория:
    <input name="newCategoryName" id="newCategoryName" type="text" value="" />
    <br />
    
    Является подкатегорией для
    <select name="generalCatId">
        <option value="0">Главная Категория</option>
        <?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['rsCategories']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
            <option value="<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</option>
        <?php } ?>
    </select>
    <br />
    <input type="button" onclick="newCategory();" value="Добавить категорию" />
</div><?php }} ?>