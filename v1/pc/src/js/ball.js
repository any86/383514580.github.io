	    var Ball = function( ball ){
	        var _ = this;
	        var ball_h = ball.height();
	        var ball_w = ball.width();
	        var step   = 1; //每次移动距离
	        var pos_x  = ball.offset().left;
	        var pos_y  = ball.offset().top;
	        var max_x  = $( window ).width();
	        var max_y  = $( window ).height();
	        var add_x  = 0; // 是否X轴正向增长
	        var add_y  = 0; // 是否Y轴正向增长        

	        setInterval( function(){
	            move_ball();
	        }, 30 );

	        function move_ball(){
	            // X轴变化
	            if( add_x ){
	                pos_x = pos_x + step;
	            }else{
	                pos_x = pos_x - step;
	            }
	            // X轴边界处理
	            if( 0 > pos_x ){
	                add_x = 1;
	                pos_x = 0;
	            }
	            if( max_x - ball_w < pos_x ){
	                add_x = 0;
	                pos_x = max_x - ball_w;
	            }
	            // Y轴变化
	            if( add_y ){
	                pos_y = pos_y + step;
	            }else{
	                pos_y = pos_y - step;
	            }
	            // Y轴边界处理
	            if( 0 > pos_y ){
	                add_y = 1;
	                pos_y = 0;
	            }
	            if( max_y - ball_h < pos_y ){
	                add_y = 0;
	                pos_y = max_y - ball_h;
	            }
	            ball.css( { "left": pos_x, "top": pos_y } );
	        }
	    }
	    
	    var ball = $( ".u-ball" );
	    ball.each( function(){
	        new Ball( $(this) );
	    } )
