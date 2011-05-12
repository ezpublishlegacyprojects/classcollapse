var slideState="collapsed";

function handleAttributeSections(eventKeyCode,userKeyCode) {
	
		if (eventKeyCode == userKeyCode) 
		{
			$('div.ezcca-collapsible-fieldset-content').each(function(index) {
				
				var container = $( this.parentNode );
				
				if( slideState == "collapsed")
				{
					if( container.hasClass('ezcca-collapsed') )
					{
						 container.removeClass('ezcca-collapsed');
					}
					
					$(this).slideDown( 150 );
				}
				else
				{
					container.addClass('ezcca-collapsed');
					$(this).slideUp( 150 );
				}
			});
			
			if( slideState == "collapsed")
			{
				slideState = "expanded";
			}
			else
			{
				slideState = "collapsed";
			}
		}
}