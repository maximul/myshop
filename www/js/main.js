/**
 * Функция добавления продукта в корзину
 * 
 * @param integer itemId ID продукта
 * @return в случае успеха обновляются данные корзины на странице
 */
function addToCart(itemId) {
    console.log('js - addToCart()');
    $.ajax({
        type: 'POST',
        async: false,
        url: '/cart/addtocart/' + itemId + '/',
        dataType: 'json',
        success: function (data) {
            if (data['success']) {
                $('#cartCntItems').html(data['cntItems']);
                
                $('#addCart_' + itemId).hide();
                $('#removeCart_' + itemId).show();
            }
        }
    });
}

/**
 * Функция удаления продукта из корзину
 * 
 * @param integer itemId ID продукта
 * @return в случае успеха обновляются данные корзины на странице
 */
function removeFromCart(itemId) {
    console.log('js - removeFromCart('+itemId+')');
    $.ajax({
        type: 'POST',
        async: false,
        url: '/cart/removefromcart/' + itemId + '/',
        dataType: 'json',
        success: function (data) {
            if (data['success']) {
                $('#cartCntItems').html(data['cntItems']);
                
                $('#addCart_' + itemId).show();
                $('#removeCart_' + itemId).hide();
            }
        }
    });
}

/**
 * Подсчёт стоимости купленного товара
 * 
 * @param integer itemId ID продукта
 */
function conversionPrice(itemId) {
    var newCnt = $('#itemCnt_' + itemId).val();
    var itemPrice = $('#itemPrice_' + itemId).attr('value');
    var itemRealPrice = newCnt * itemPrice;
    
    $('#itemRealPrice_' + itemId).html(itemRealPrice);
}

/**
 * Получение данных с формы
 */
function getData(obj_form) {
    var hData = {};
    $('input, textarea, select', obj_form).each(function () {
        if (this.name && this.name != '') {
            hData[this.name] = this.value;
            console.log('hData[' + this.name + '] = ' + hData[this.name]);
        }
    });
    return hData;
}

/**
 * Регистрация нового пользователя
 */
function registerNewUser() {
    var postData = getData('#registerBox');

    $.ajax({
        type: 'POST',
        async: false,
        url: "/user/register/",
        data: postData,
        dataType: 'json',
        success: function (data) {
            if (data['success']) {
                alert('Регистрация прошла успешо');

                //> блок в левом столбце
                $('#registerBox').hide();

                $('#userLink').attr('href', '/user/');
                $('#userLink').html(data['userName']);
                $('#userBox').show();
                //<

                //> страница заказа
                $('#loginBox').hide();
                $('#btnSaveOrder').show();
                //>
            } else {
                alert(data['message']);
            }
        }
    });
}

/**
 * Авторизация пользователя
 */
function login() {
    var email = $('#loginEmail').val();
    var pwd = $('#loginPwd').val();

    var postData = "email=" + email + "&pwd=" + pwd;

    $.ajax({
        type: 'POST',
        async: false,
        url: "/user/login/",
        data: postData,
        dataType: 'json',
        success: function (data) {
            if (data['success']) {
                $('#registerBox').hide();
                $('#loginBox').hide();

                $('#userLink').attr('href', '/user/');
                $('#userLink').html(data['displayName']);
                $('#userBox').show();
                
                //> заполняем поля а странице заказа
                $('#name').val(data['name']);
                $('#phone').val(data['phone']);
                $('#address').val(data['address']);
                //<
                
                $('#btnSaveOrder').show();

            } else {
                alert(data['message']);
            }
        }
    });
}

/**
 * Выход пользователя
 */
function logout() {
    $.ajax({
        type: 'POST',
        async: false,
        url: "/user/logout/",
        dataType: 'json',
        success: function (data) {
            if (data['success']) {
                $('#registerBox').show();
                $('#loginBox').show();
                
                $('#userBox').hide();
                
                $('#loginEmail').attr('value', '');
                $('#loginPwd').attr('value', '');
                document.location = '/';
            }
        }
    });
}

/**
 * Показать или спрятать форму регистрации
 */
function showRegisterBox() {
    if ( $('#registerBoxHidden').css('display') != 'block' ) {
        $('#registerBoxHidden').show();
    } else {
        $('#registerBoxHidden').hide();
    }
    //$('#registerBoxHidden').toggle();
}

/**
 * Обновление данных пользователя.
 */
function updateUserData() {
    console.log('js - updateUserData()');
    var postData = getData('#registerData');
    
    $.ajax({
        type: 'POST',
        async: false,
        url: "/user/update/",
        data: postData,
        dataType: 'json',
        success: function (data) {
            if (data['success']) {
                $('#userLink').html(data['userName']);
                alert(data['message']);
            } else {
                alert(data['message']);
            }
        }
    });
}

/**
 * Сохраение заказа
 */
function SaveOrder() {
    var postData = getData('form');
    
    $.ajax({
        type: 'POST',
        async: false,
        url: "/cart/saveorder/",
        data: postData,
        dataType: 'json',
        success: function (data) {
            if (data['success']) {
                alert(data['message']);
                document.location = '/';
            } else {
                alert(data['message']);
            }
        }
    });
}

/**
 * Показывать или прятать данные о заказе
 */
function showProducts(id) {
    var objName = "#purchasesForOrderId_" + id;
    //if ( $(objName).css('display') != 'table-row' ) {
//        $(objName).show();
//    } else {
//        $(objName).hide();
//    }
    $(objName).toggle();
}