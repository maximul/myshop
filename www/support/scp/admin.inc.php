<?php
/*********************************************************************
    admin.inc.php

    Handles all admin related pages....everything admin!

    Peter Rotich <peter@osticket.com>
    Copyright (c)  2006-2013 osTicket
    http://www.osticket.com

    Released under the GNU General Public License WITHOUT ANY WARRANTY.
    See LICENSE.TXT for details.

    vim: expandtab sw=4 ts=4 sts=4:
**********************************************************************/
require('staff.inc.php');
//Make sure config is loaded and the staff is set and of admin type
if(!$ost or !$thisstaff or !$thisstaff->isAdmin()){
    header('Location: index.php');
    require('index.php'); // just in case!
    exit;
}
//Define some constants.
define('OSTADMININC',TRUE); //checked by admin include files
define('ADMINPAGE',TRUE);   //Used by the header to swap menus.

//Some security related warnings - bitch until fixed!!! :)
$sysnotice= '';
if($ost->isUpgradePending()) {
    $errors['err']=$sysnotice='Система нуждается в обновлении... <a href="upgrade.php">Обновить сейчас</a>';
    if(!in_array(basename($_SERVER['SCRIPT_NAME']), array('upgrade.php', 'logs.php'))) {
        header('Location: upgrade.php');
        require('upgrade.php');
        exit;
    }
} else {
    
    if(!strcasecmp(basename(CONFIG_FILE), 'settings.php')) {
        $sysnotice=sprintf('Пожалуйста переименуйте файл include/%s в include/ost-config.php для разрешения конфликтов',
                                basename(CONFIG_FILE));
        //Die gracefully - otherwise upgraded RC5 installations will die with confusing message. 
        if(!strcasecmp(basename($_SERVER['SCRIPT_NAME']), 'settings.php'))
            die($sysnotice);

    } elseif(file_exists('../setup/')) {
        $sysnotice='Пожалуйста удалите <strong>setup/install</strong> каталог (../setup/) для обеспечения защиты системы.';
    } elseif(CONFIG_FILE && file_exists(CONFIG_FILE) && is_writable(CONFIG_FILE)) {
            //Confirm for real that the file is writable by group or world.
            clearstatcache(); //clear the cache!
            $perms = @fileperms(CONFIG_FILE);
            if(($perms & 0x0002) || ($perms & 0x0010)) {
                $sysnotice=sprintf('Пожалуйста измените права у файла конфигурации (%s) для удалении прав на запись. (пример: <i>chmod 644 %s)</i>',
                                basename(CONFIG_FILE), basename(CONFIG_FILE));
            }
    }

    if(!$sysnotice && ini_get('register_globals'))
        $sysnotice='Пожалуйста отключите register globals если это возможно';
}

//System notice displayed as a warning (if any).
$ost->setWarning($sysnotice);

//Admin navigation - overwrites what was set in staff.inc.php
$nav = new AdminNav($thisstaff);

//Page title.
$ost->setPageTitle('osTicket - Панель управления администратора');
?>
