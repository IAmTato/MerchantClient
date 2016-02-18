( function($) {
	if ($.ui.accordion) {
		var old_clickHandler = $.ui.accordion.prototype._eventHandler;
		var new_clickHandler = function(event) {
			var o = this.options;
			if (o.disabled)
				return false;
			var options = this.options,
			oldactive = this.active,
			clicked = $( event.currentTarget ),
			clickedIsActive = clicked[ 0 ] === oldactive[ 0 ],
			collapsing = clickedIsActive && options.collapsible,
			toShow = collapsing ? $() : clicked.next(),
			toHide = oldactive.next(),
			//eventData ×¼±¸ÇÐ»»
			eventData = {
				oldHeader: oldactive,
				oldPanel: toHide,
				newHeader: collapsing ? $() : clicked,
				newPanel: toShow
			};

			event.preventDefault();
	
			if (( clickedIsActive && !options.collapsible ) ||( this._trigger( "beforeActivate", event, eventData ) === false ) ) {
				return false;
			}
	
			options.active = collapsing ? false : this.headers.index( clicked );
	
			// when the call to ._toggle() comes after the class changes
			// it causes a very odd bug in IE 8 (see #6720)
			this.active = clickedIsActive ? $() : clicked;
			this._toggleComplete( eventData );
		};
		$.extend($.ui.accordion.defaults, {
			collapsible : true,
			multipleMode : false
		});
		
		$.extend($.ui.accordion.prototype, {
			_eventHandler : function(event) {
				if (this.options.multipleMode === true) {
					new_clickHandler.apply(this,arguments);
				} else {
					old_clickHandler.apply(this,arguments);
				}
			}
		});
		
		var old_toggleComplete = $.ui.accordion.prototype._toggleComplete;
		var new_toggleComplete = function(data) {
			var options = this.options;
			
			var clickedIsActive = false;
			var ps = true;
			if(data.newHeader.length){
				this.prevShow.add( this.prevHide ).stop( true, true );
				var hs = data.newPanel.attr("aria-hidden");
				if(hs === "false"){
					this.prevShow = $();
					this.prevHide = data.newPanel;
					data.oldHeader = data.newHeader;
					data.oldPanel = data.newPanel;
					clickedIsActive = true;
					ps = false;
				}else{
					var tmp = this.prevShow;
					this.prevShow = data.newPanel;
					this.prevHide = tmp;
				}
			}else{
				clickedIsActive = true;
				this.prevHide = data.oldPanel;
			}
			if ( !clickedIsActive ) {
				data.newHeader
					.attr({
						"aria-selected": "true",
						tabIndex: 0,
						"aria-expanded": "true"
					});
				data.newHeader
					.removeClass( "ui-corner-all" )
					.addClass( "ui-accordion-header-active ui-state-active ui-corner-top" );
				
				
				data.newPanel.attr( "aria-hidden", "false" );
				data.newPanel.addClass( "ui-accordion-content-active" ).css({overflow:"auto",height:"auto"});
				if ( options.icons ) {
					data.newHeader.children( ".ui-accordion-header-icon" )
					.removeClass( options.icons.header )
					.addClass( options.icons.activeHeader );
					
					data.newPanel.children( ".ui-accordion-header-icon" )
						.removeClass( options.icons.header )
						.addClass( options.icons.activeHeader );
				}
				data.newPanel.show();
			}else{
				data.oldHeader
					.attr({
						"aria-selected": "false" ,
						"tabIndex": -1,
						"aria-expanded": "false"
					});
				data.oldHeader
					.removeClass( "ui-accordion-header-active ui-state-active ui-corner-top" )
					.addClass( "ui-corner-all" );
				
				data.oldPanel.attr("aria-hidden","true");
				data.oldPanel.removeClass("ui-accordion-content-active").css({overflow:"hidden",height:"auto"});
				if (options.icons ) {
					data.oldHeader.children( ".ui-accordion-header-icon" )
					.removeClass( options.icons.header )
					.addClass( options.icons.activeHeader );
					
					data.oldPanel.children( ".ui-accordion-header-icon" )
						.removeClass( options.icons.activeHeader )
						.addClass( options.icons.header );
				}
				data.oldPanel.hide();
			}
			// Work around for rendering bug in IE (#5421)
			if(ps==false)
				return;
			this._trigger( "activate", null, data );

		};
		$.extend($.ui.accordion.prototype, {
			_toggleComplete : function(data) {
				if (this.options.multipleMode === true) {
					new_toggleComplete.apply(this,arguments);
				} else {
					old_toggleComplete.apply(this,arguments);
				}
			}
		});
		
		
	}
	;
})(jQuery);