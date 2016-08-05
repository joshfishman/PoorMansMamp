<?php require('configs/header.php'); ?>
<div class="header">
    <div class="container clearfix">
        <h1 id="logo">POMAMA</h1>
        <nav>
        	<?php
                   foreach ( $topnav as $nav) {
			            	printf( '<a href="%1$s" target="%3$s">%2$s</a>', $nav['url'], $nav['name'] , $nav['target']);
			              }
			 ?>
        </nav>
    </div>
</div>
