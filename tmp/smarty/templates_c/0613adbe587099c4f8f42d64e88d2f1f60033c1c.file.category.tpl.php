<?php /* Smarty version Smarty-3.1-DEV, created on 2016-11-25 00:46:50
         compiled from "..\views\texturia\category.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2322657e04c7fda8a81-61881316%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '0613adbe587099c4f8f42d64e88d2f1f60033c1c' => 
    array (
      0 => '..\\views\\texturia\\category.tpl',
      1 => 1480031206,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2322657e04c7fda8a81-61881316',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1-DEV',
  'unifunc' => 'content_57e04c7fed95d0_18882685',
  'variables' => 
  array (
    'rsCategory' => 0,
    'rsProducts' => 0,
    'item' => 0,
    'rsChildCats' => 0,
    'comment' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_57e04c7fed95d0_18882685')) {function content_57e04c7fed95d0_18882685($_smarty_tpl) {?>
<h1>Товары категории <?php echo $_smarty_tpl->tpl_vars['rsCategory']->value['name'];?>
</h1>

<div class="joomcat">
    <div class="joomcat65_row">
        <?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['rsProducts']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['products']['iteration']=0;
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['products']['iteration']++;
?>
            <div style="width:216px !important;margin-right:10px;" class="joomcat65_imgct">
                <div class="joomcat65_img cat_img">
                    <a href="/product/<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
/">
                        <img src="/images/products/th_<?php echo $_smarty_tpl->tpl_vars['item']->value['image'];?>
" width="100" />
                    </a>
                </div>
                <div style="padding-bottom:10px;padding-top:0px;" class="joomcat65_txt">
                    <ul>
                        <li><a href="/product/<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
/"><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</a></li>
                    </ul>
                </div>
            </div>

            <?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['products']['iteration']%3==0){?>
            <div class="joomcat65_clr"></div>
    </div>
    <div class="joomcat65_row">
            <?php }?>
        <?php } ?>
    </div>
</div>
    
<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['rsChildCats']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
    <h2><a href="/category/<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
/"><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</a></h2>
<?php } ?>

<?php if ($_smarty_tpl->tpl_vars['rsProducts']->value==null){?>
    <h3 align="center"><?php echo $_smarty_tpl->tpl_vars['comment']->value;?>
</h3>
<?php }?>  <?php }} ?>