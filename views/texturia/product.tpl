{* Страница продукта *}
<div id="jf-content">
    <div id="image_d" class="gallery">
  
        <div>
            <h3 id="jg_photo_title" class="jg_imgtitle">
                {$rsProduct['name']}
            </h3>
        </div>
    
        <!--div class="jg_back" id="jg_back_detail">
          <a href="/index.php?view=category&amp;catid=5&amp;option=com_joomgallery&amp;Itemid=465">back</a>
        </div-->
  
        <div style="text-align: center;" id="jg_dtl_photo" class="jg_dtl_photo">
            <img width="675" id="jg_photo_big" class="jg_photo" src="/images/products/{$rsProduct['image']}"/>
        </div>

        <div class="jg_photo_details" style="font-size: 20px; padding-top: 20px;">
            <div class="jg_details">
                <div class="sectiontableentry2">
                    <div class="jg_photo_left">
                        Стоимость:
                    </div>
                    <div id="jg_photo_date" class="jg_photo_right">
                        {$rsProduct['price']}
                    </div>
                </div>
            </div>
            <div class="jg_detailnavi" style="padding-top: 8px;">
                <div class="jg_iconbar">
                    <a id="removeCart_{$rsProduct['id']}" {if ! $itemInCart} class="hideme" {/if} href="#" onclick="removeFromCart({$rsProduct['id']}); return false;" alt="Удалить из корзины">Удалить из корзины</a>
                    <a id="addCart_{$rsProduct['id']}" {if $itemInCart} class="hideme" {/if} href="#" onclick="addToCart({$rsProduct['id']}); return false;" alt="Добавить в корзину">Добавить в корзину</a>
                </div>
            </div>
        </div>

        <div id="jg_photo_description">
            <div id="jg_photo_description_label">
                Описание
            </div>
            <div class="jg_photo_des">
                <p>{$rsProduct['description']}</p>
            </div>
        </div>
        <div class="sectiontableheader">
            &nbsp;
        </div>
    </div>
</div>
