<?php
if(!defined('OSTSTAFFINC') || !$category || !$thisstaff) die('Access Denied');

?>
<div style="width:700;padding-top:10px; float:left;">
  <h2>Вопросы и ответы</h2>
</div>
<div style="float:right;text-align:right;padding-top:5px;padding-right:5px;">&nbsp;</div>
<div class="clear"></div>
<br>
<div>
    <strong><?php echo $category->getName() ?></strong>
    <span>(<?php echo $category->isPublic()?'Опубликовано':'Не опубликовано'; ?>)</span>
    <time>Последнее обновление <?php echo Format::db_daydatetime($category->getUpdateDate()); ?></time>
</div>
<div class="cat-desc">
<?php echo Format::safe_html($category->getDescription()); ?>
</div>
<?php
if($thisstaff->canManageFAQ()) {
    echo sprintf('<div class="cat-manage-bar"><a href="categories.php?id=%d" class="Icon editCategory">Изменить категорию</a>
             <a href="categories.php" class="Icon deleteCategory">Удалить категорию</a>
             <a href="faq.php?cid=%d&a=add" class="Icon newFAQ">Добавить новый вопрос-ответ</a></div>',
            $category->getId(),
            $category->getId());
} else {
?>
<hr>
<?php
}

$sql='SELECT faq.faq_id, question, ispublished, count(attach.file_id) as attachments '
    .' FROM '.FAQ_TABLE.' faq '
    .' LEFT JOIN '.FAQ_ATTACHMENT_TABLE.' attach ON(attach.faq_id=faq.faq_id) '
    .' WHERE faq.category_id='.db_input($category->getId())
    .' GROUP BY faq.faq_id';
if(($res=db_query($sql)) && db_num_rows($res)) {
    echo '<div id="faq">
            <ol>';
    while($row=db_fetch_array($res)) {
        echo sprintf('
            <li><a href="faq.php?id=%d" class="previewfaq">%s <span>- %s</span></a></li>',
            $row['faq_id'],$row['question'],$row['ispublished']?'Опубликовано':'Не опубликовано');
    }
    echo '  </ol>
         </div>';
}else {
    echo '<strong>Категория не содержит вопросов и ответов</strong>';
}
?>
