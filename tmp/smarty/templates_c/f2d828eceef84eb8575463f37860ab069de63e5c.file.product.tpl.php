<?php /* Smarty version Smarty-3.1-DEV, created on 2016-09-19 21:53:20
         compiled from "..\views\texturia\product.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2681857e0286d379533-12926974%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f2d828eceef84eb8575463f37860ab069de63e5c' => 
    array (
      0 => '..\\views\\texturia\\product.tpl',
      1 => 1474314718,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2681857e0286d379533-12926974',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1-DEV',
  'unifunc' => 'content_57e0286d42d059_97306943',
  'variables' => 
  array (
    'rsProduct' => 0,
    'itemInCart' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_57e0286d42d059_97306943')) {function content_57e0286d42d059_97306943($_smarty_tpl) {?>
<div id="jf-content">
    <div id="image_d" class="gallery">
  
        <div>
            <h3 id="jg_photo_title" class="jg_imgtitle">
                <?php echo $_smarty_tpl->tpl_vars['rsProduct']->value['name'];?>

            </h3>
        </div>
    
        <!--div class="jg_back" id="jg_back_detail">
          <a href="/index.php?view=category&amp;catid=5&amp;option=com_joomgallery&amp;Itemid=465">back</a>
        </div-->
  
        <div style="text-align: center;" id="jg_dtl_photo" class="jg_dtl_photo">
            <img width="675" id="jg_photo_big" class="jg_photo" src="/images/products/<?php echo $_smarty_tpl->tpl_vars['rsProduct']->value['image'];?>
"/>
        </div>

        <div class="jg_photo_details" style="font-size: 20px; padding-top: 20px;">
            <div class="jg_details">
                <div class="sectiontableentry2">
                    <div class="jg_photo_left">
                        Стоимость:
                    </div>
                    <div id="jg_photo_date" class="jg_photo_right">
                        <?php echo $_smarty_tpl->tpl_vars['rsProduct']->value['price'];?>

                    </div>
                </div>
            </div>
            <div class="jg_detailnavi" style="padding-top: 8px;">
                <div class="jg_iconbar">
                    <a id="removeCart_<?php echo $_smarty_tpl->tpl_vars['rsProduct']->value['id'];?>
" <?php if (!$_smarty_tpl->tpl_vars['itemInCart']->value){?> class="hideme" <?php }?> href="#" onclick="removeFromCart(<?php echo $_smarty_tpl->tpl_vars['rsProduct']->value['id'];?>
); return false;" alt="Удалить из корзины">Удалить из корзины</a>
                    <a id="addCart_<?php echo $_smarty_tpl->tpl_vars['rsProduct']->value['id'];?>
" <?php if ($_smarty_tpl->tpl_vars['itemInCart']->value){?> class="hideme" <?php }?> href="#" onclick="addToCart(<?php echo $_smarty_tpl->tpl_vars['rsProduct']->value['id'];?>
); return false;" alt="Добавить в корзину">Добавить в корзину</a>
                </div>
            </div>
        </div>

        <div id="jg_photo_description">
            <div id="jg_photo_description_label">
                Описание
            </div>
            <div class="jg_photo_des">
                <p><?php echo $_smarty_tpl->tpl_vars['rsProduct']->value['description'];?>
</p>
            </div>
        </div>
        <div class="sectiontableheader">
            &nbsp;
        </div>
    </div>
</div>
<?php }} ?>