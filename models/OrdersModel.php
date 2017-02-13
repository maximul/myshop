<?php

/**
 * Модель для таблицы заказов (orders)
 */

/**
 * Создание заказа (без привязки товара)
 * 
 * @param string $name
 * @param string $phone
 * @param string $address
 * @return integer ID созданого заказа
 */
function makeNewOrder($name, $phone, $address)
{
    //> инициализация перем-х
    $userId     =   $_SESSION['user']['id'];
    $comment    =   "id пользователя: $userId<br />
                    Имя: $name<br />
                    Тел.: $phone<br />
                    Адрес: $address";
                    
    $dateCreated    = date('Y.m.d H:i:s');
    $userIp         = $_SERVER['REMOTE_ADDR'];
    //<
    
    // формирование запроса к БД
    $sql = "INSERT INTO
            `orders` (`user_id`, `date_created`, `date_payment`, `status`, `comment`, `user_ip`)
            VALUES ('$userId', '$dateCreated', null, '0', '$comment', '$userIp')";
            
    $rs = mysql_query($sql);
    
    // получить id созданного заказа
    if ($rs) {
        $sql = "SELECT id
                FROM `orders` 
                ORDER BY `id` DESC
                LIMIT 1";
        
        $rs = mysql_query($sql);
        // преобразование рез-тов запроса
        $rs = createSmartyRsArray($rs);
        
        // возвр-ем id созд-го запроса
        if (isset($rs[0])) {
            return $rs[0]['id'];
        }
    }
    
    return false;
}

/**
 * Получить список заказов с привязкой к продуктам для пользователя $userId
 * 
 * @param integer $userId ID пользователя
 * @return array массив заказов с привязкой к продуктам
 */
function getOrdersWithProductsByUser($userId)
{
    $userId = intval($userId);
    $sql = "SELECT * FROM `orders`
            WHERE `user_id` = '$userId'
            ORDER BY `id` DESC";
    
    $rs = mysql_query($sql);
    
    $smartyRs = array();
    while ($row = mysql_fetch_assoc($rs)) {
        $rsChilren = getPurchaseForOrder($row['id']);
        
        if ($rsChilren) {
            $row['children'] = $rsChilren;
            $smartyRs[] = $row;
        }
    }
    
    return $smartyRs;
}

function getOrders()
{
    $sql = "SELECT o.*, u.name, u.email, u.phone, u.address 
            FROM `orders` AS `o`
            LEFT JOIN `users` AS `u` ON o.user_id = u.id
            ORDER BY `id` DESC";
    
    $rs = mysql_query($sql);
    
    $smartyRs = array();
    while ($row = mysql_fetch_assoc($rs)) {
        $rsChilren = getProductsForOrder($row['id']);
        
        if ($rsChilren) {
            $row['children'] = $rsChilren;
            $smartyRs[] = $row;
        }
    }
    
    return $smartyRs;
}

/**
 * Получить продукты заказа
 * 
 * @param integer $userId ID заказа
 * @return array массив данных товара
 */
function getProductsForOrder($orderId)
{
    $sql = "SELECT *
            FROM `purchase` as `pe`
            LEFT JOIN `products` as `ps`
                ON `pe`.`product_id` = `ps`.`id`
            WHERE (`order_id` = '$orderId')";
            
    $rs = mysql_query($sql);
    return createSmartyRsArray($rs);
}

function updateOrderSatus($itemId, $status)
{
    $status = intval($status);
    $sql = "UPDATE `orders`
            SET `status` = '$status'
            WHERE `id` = '$itemId'";

    $rs = mysql_query($sql);
    return $rs;
}

function updateOrderDatePayment($itemId, $datePayment)
{
    $sql = "UPDATE `orders`
            SET `date_payment` = '$datePayment'
            WHERE `id` = '$itemId'";

    $rs = mysql_query($sql);
    return $rs;
}