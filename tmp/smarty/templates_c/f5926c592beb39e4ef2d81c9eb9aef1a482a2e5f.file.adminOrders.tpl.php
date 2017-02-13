<?php /* Smarty version Smarty-3.1-DEV, created on 2016-08-03 01:33:19
         compiled from "..\views\admin\adminOrders.tpl" */ ?>
<?php /*%%SmartyHeaderCode:932157a0e64119a981-33592664%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f5926c592beb39e4ef2d81c9eb9aef1a482a2e5f' => 
    array (
      0 => '..\\views\\admin\\adminOrders.tpl',
      1 => 1470180163,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '932157a0e64119a981-33592664',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1-DEV',
  'unifunc' => 'content_57a0e6411b2091_34295376',
  'variables' => 
  array (
    'rsOrders' => 0,
    'item' => 0,
    'itemChild' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_57a0e6411b2091_34295376')) {function content_57a0e6411b2091_34295376($_smarty_tpl) {?><h2>Заказы</h2>
<?php if (!$_smarty_tpl->tpl_vars['rsOrders']->value){?>
    Нет заказов
<?php }else{ ?>
    <table border="1" cellpadding="1" cellspacing="1">
        <tr>
            <th>№</th>
            <th>Действие</th>
            <th>ID заказа</th>
            <th width="110">Статус</th>
            <th>Дата создания</th>
            <th>Дата оплаты</th>
            <th>Дополительая иформация</th>
            <th>Дата изменения заказа</th>
        </tr>
        <?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['rsOrders']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['orders']['iteration']=0;
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['orders']['iteration']++;
?>
            <tr>
                <td><?php echo $_smarty_tpl->getVariable('smarty')->value['foreach']['orders']['iteration'];?>
</td>
                <td><a href="#" onclick="showProducts(<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
); return false;">Показать товар заказа</a></td>
                <td><?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
</td>
                <td>
                    <input type="checkbox" id="itemStatus_<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
" <?php if ($_smarty_tpl->tpl_vars['item']->value['status']){?>checked="checked"<?php }?> onclick="updateOrderStatus('<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
');" />Закрыт
                </td>
                <td><?php echo $_smarty_tpl->tpl_vars['item']->value['date_created'];?>
</td>
                <td>
                    <input id="datePayment_<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
" type="text" value="<?php echo $_smarty_tpl->tpl_vars['item']->value['date_payment'];?>
" />
                    <input type="button" value="Сохранить" onclick="updateDatePayment(<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
);" />
                </td>
                <td><?php echo $_smarty_tpl->tpl_vars['item']->value['comment'];?>
</td>
                <td><?php echo $_smarty_tpl->tpl_vars['item']->value['date_modification'];?>
</td>
            </tr>

            <tr class="hideme" id="purchasesForOrderId_<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
">
                <td colspan="8">
                    <?php if ($_smarty_tpl->tpl_vars['item']->value['children']){?>
                        <table border="1" cellpadding="1" cellspacing="1" width="100%">
                            <tr>
                                <th>№</th>
                                <th>ID</th>
                                <th>Название</th>
                                <th>Цена</th>
                                <th>Количество</th>
                            </tr>
                            <?php  $_smarty_tpl->tpl_vars['itemChild'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['itemChild']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['item']->value['children']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['products']['iteration']=0;
foreach ($_from as $_smarty_tpl->tpl_vars['itemChild']->key => $_smarty_tpl->tpl_vars['itemChild']->value){
$_smarty_tpl->tpl_vars['itemChild']->_loop = true;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['products']['iteration']++;
?>
                                <tr>
                                    <td><?php echo $_smarty_tpl->getVariable('smarty')->value['foreach']['products']['iteration'];?>
</td>
                                    <td><?php echo $_smarty_tpl->tpl_vars['itemChild']->value['id'];?>
</td>
                                    <td><a href="/product/<?php echo $_smarty_tpl->tpl_vars['itemChild']->value['id'];?>
/"><?php echo $_smarty_tpl->tpl_vars['itemChild']->value['name'];?>
</a></td>
                                    <td><?php echo $_smarty_tpl->tpl_vars['itemChild']->value['price'];?>
</td>
                                    <td><?php echo $_smarty_tpl->tpl_vars['itemChild']->value['amount'];?>
</td>
                                </tr>
                            <?php } ?>
                        </table>
                    <?php }?>
                </td>
            </tr>
        <?php } ?>
    </table>
<?php }?><?php }} ?>