var UI = (function () {
	return {
		init: function () {
			this.event();
		},
		element:{
			layout:{
				header:'#header',
			},
			gnb: {
				wrap: '.gnb-wrap',
				btn: '.snb-more',
				snb: '.snb-wrap'
			},
			layer: {
				name: '.pop-layer',
				wrap: '.pop-wrap',
				btn: '.btn-close, .dim',
				playWrap: '.play-area'
			}
		},
		event: function () {
			var lThiz = this.element;
			var nPos = jQuery(window).scrollTop();

			//GNB
			jQuery(lThiz.gnb.btn).on('click',function(e){
				jQuery(this).toggleClass('active');
				jQuery(lThiz.gnb.snb).toggleClass('active');
			});

			jQuery(lThiz.gnb.snb).on('click',function(e){
				jQuery(this).removeClass('active');
				jQuery(lThiz.gnb.btn).removeClass('active');
			});
			//--------GNB

			// tip-box hide
			jQuery('.tip-box').delay(2000).fadeOut("slow");

			// tab
			jQuery('.js_tab').find('a').on('click', function (e) {
				e.preventDefault();
				/*
				if (detailTab.length > 0) {
					detailTab.removeAttr('style');
				}
				*/
				jQuery(this).parent('li').addClass('active').siblings('li').removeClass('active');
				jQuery(jQuery(this).attr('href')).addClass('active').siblings('div').removeClass('active');
				return false;
			});

			// toggle
			jQuery('.btn-toggle-close').each(function () {
				var parent = jQuery(this).parent();
				var toggleBox = jQuery(this).parents().children('.js_toggle_box');
				if (toggleBox.hasClass('close')) {
					toggleBox.hide();
					parent.addClass('close');
				}
			});
			jQuery('.btn-toggle-close').on('click', function (e) {
				var parent = jQuery(this).parent();
				var toggleBox = jQuery(this).parents().children('.js_toggle_box');
				e.preventDefault();
				if (parent.hasClass('close')) {
					parent.removeClass('close');
					toggleBox.removeClass('close');
					toggleBox.slideDown();
				} else {
					parent.addClass('close');
					toggleBox.addClass('close');
					toggleBox.slideUp();
				}
			});

			// radio,checkbox
			jQuery("input[type='checkbox'],input[type='radio']").each(function () {
				if (jQuery(this).attr('checked')) {
					jQuery(this).parent().addClass('selected');
				} else {
					jQuery(this).parent().removeClass('selected');
				}
			});

			// checkbox
			jQuery("input[type='checkbox']").change(function () {
				if (jQuery(this).is(':checked')) {
					jQuery(this).parent().addClass('selected');
					jQuery(this).attr('checked', true);
				} else {
					jQuery(this).parent().removeClass('selected');
					jQuery(this).attr('checked', false);
				}
			});

			// radio
			jQuery("input[type='radio']").change(function () {
				jQuery('input:radio[name=' + $(this).attr('name') + ']').parent().removeClass('selected');
				jQuery(this).parent().addClass('selected');
			});

			//select
			jQuery("[class^='select-type'] select").on('change', function () {
				$(this).addClass('selected');
			});


			var lThiz = this.element;
			var lNtop = jQuery(window).scrollTop();
			var imgBox=jQuery('.img-wrap');
			var imgBoxWrap=jQuery('.menu-info');

			if(imgBox.length>0){
				var asideTop = imgBox.offset().top-100;

				chkFixed(lNtop);

				function resetFixed() {
					imgBox.removeClass("fixed");
				}

				function chkFixed(nTop) {
					if (imgBoxWrap.outerHeight() > imgBox.outerHeight()) {

						if (nTop > asideTop) {
							imgBox.addClass("fixed");
						} else {
							resetFixed();
						}

						if (imgBox.hasClass("fixed")) {
							var scrollHeight = $(document).height();
							var scrollPosition = $(window).height() + $(window).scrollTop();

							if ((scrollHeight - scrollPosition) <= scrollHeight-(imgBoxWrap.outerHeight()+imgBoxWrap.offset().top+300)) {
								imgBox.removeClass("fixed");
								imgBox.addClass("bottom");
							} else {
								imgBox.addClass("fixed");
								imgBox.removeClass("bottom");
							}
						}
					} else {
						resetFixed();
					}
				}
			}

			var lNtop = jQuery(window).scrollTop();
			gnbFix(lNtop);//gnb

			function gnbFix(lNtop){
				if (lNtop > 10) {
					var h=-(jQuery(lThiz.layout.header).outerHeight() - jQuery(lThiz.gnb.wrap).outerHeight())+'px';
					jQuery(lThiz.layout.header).css({
						'transform':'translateY('+h+')'
					});
				}else if(lNtop < jQuery(lThiz.layout.header).find('.top-wrap').outerHeight()){
					jQuery(lThiz.layout.header).css({
						'transform':'translateY(0)'
					});
				}
			}

			jQuery(window).scroll(function (e) {
				var lNtop = jQuery(this).scrollTop();

				e.preventDefault();

				if(imgBox.length>0) {
					var scroll = jQuery(window).scrollTop();
					chkFixed(scroll);
				}
				gnbFix(lNtop);
			});


			
		},
		layerPopUp: function (pOption) {
			/*   pOption
			*  {
			*  	 state : 'open'  OR  'close'
			*  	 selId : Layer Selector
			*  }
			*/
			var lThiz = this;
			var lLayer = $(pOption.selId);
			var lUrl = pOption.url;
			var lData = pOption.data;
			var lLayerBox = $(pOption.selId).find(lThiz.element.layer.wrap);
			var playAre = lLayerBox.find('.pop-player');
			var iframe = playAre.html();

			if(lUrl != undefined){
			    if(lData != undefined){
			        lLayer.load(lUrl,lData,function(response, status, xhr) {
			            lLayerBox = $(pOption.selId).find(lThiz.element.layer.wrap);
			            layerSet();
			        });
			    }else{
			        lLayer.load(lUrl,function(response, status, xhr) {
			            lLayerBox = $(pOption.selId).find(lThiz.element.layer.wrap);
			            layerSet();
			        });
			    }
			}else{
			    layerSet();
			}


			function layerSet(){
				if (pOption.st !== 'close') {
					if(playAre){
						playAre.html(iframe);
						lLayer.find('iframe').attr('src', pOption.src);
					}
					lLayer.fadeIn();
					lLayer.find('.slick-slider').slick('setPosition');//slideSet
					lLayerBox.css('margin-left', '-' + lLayerBox.outerWidth() / 2 + 'px');
					if (lLayerBox.outerHeight() < $(document).height()) {
						lLayerBox.css('margin-top', '-' + lLayerBox.outerHeight() / 2 + 'px');
					} else {
						lLayerBox.css('top', '0');
					}
					if(pOption.st !== 'noDim'){
						jQuery('body').addClass('fixed');
					}
				} else {
					playAre.html('');
					$('body').removeClass('fixed');
					lLayer.fadeOut();
					playAre.html(iframe);
				}
			}
			function layerClose(closeThiz){

			}

			lLayer.find(lThiz.element.layer.btn).click(function (e) {
				e.preventDefault();
				playAre.html('');
				jQuery('body').removeClass('fixed');
				jQuery(this).closest(lThiz.element.layer.name).fadeOut();
				lLayerBox.find('.pop-content').scrollTop(0);
				playAre.html(iframe);
			});
		}
	}
})();

jQuery(document).ready(function () {
	UI.init();
});