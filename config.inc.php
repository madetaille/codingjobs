<?php
// use here a value of your choice at least 32 chars long
$cfg['blowfish_secret'] = '1{dd0`<Q),5XP_:R9UK%%8\"EEcyH#{o';

$i=0;
$i++;
$cfg['Servers'][$i]['auth_type']     = 'cookie';
// if you insist on "root" having no password:
$cfg['Servers'][$i]['user'] = 'root';
$cfg['Servers'][$i]['password'] = 'root';
$cfg['Servers'][$i]['AllowNoPassword'] = false;

$cfg['Servers'][$i]['controluser'] = 'root';
$cfg['Servers'][$i]['controlpass'] = 'rootroot';
