/* General demo helpers */
$(function() {
    // Smallipop creation calls
    $('.smallipop').smallipop();

    $('.smallipopOrange').smallipop({
        theme: 'orange'
    });
    $('.smallipopBlack').smallipop({
        theme: 'black'
    });
    $('.smallipopHideBlack').smallipop({
        theme: 'black',
        hideTrigger: true
    });

    $('.smallipopBlue').smallipop({
        theme: 'blue',
        invertAnimation: true
    });

    $('.smallipopBlueFatShadow').smallipop({
        theme: 'blue fatShadow',
        invertAnimation: true
    });

    $('.smallipopHideBlue').smallipop({
        theme: 'blue',
        hideTrigger: true,
        popupYOffset: 40,
        invertAnimation: true
    });

    $('.smallipopWhite').smallipop({
        theme: 'white'
    });

    $('.smallipopHide').smallipop({
        hideTrigger: true,
        theme: 'white',
        popupYOffset: 5
    });

    $('.smallipopHideTrans').smallipop({
        hideTrigger: true,
        theme: 'white whiteTransparent',
        popupYOffset: 20
    });

    $('.smallipopStatic').smallipop({
        theme: 'black',
        popupDistance: 0,
        popupYOffset: -14,
        popupAnimationSpeed: 100
    });

    $('.smallipopBottom').smallipop({
        theme: 'black',
        preferredPosition: 'bottom'
    });

    $('.smallipopHorizontal').smallipop({
        preferredPosition: 'right',
        theme: 'black',
        popupOffset: 10,
        invertAnimation: true
    });

    $('.smallipopFormElement').smallipop({
        preferredPosition: 'right',
        theme: 'black',
        popupOffset: 0,
        triggerOnClick: true
    });

    $('#tipcustomhint').smallipop({}, "I'm the real hint!");

    $(document).delegate('#tipkiller', 'click', function(e) {
        e.preventDefault();
        $('#ajaxContainer').html('<div>Some new content</div>');
    });

    $(document).delegate('#tipkiller2', 'click', function(e) {
        e.preventDefault();
        $('#ajaxContainer2').html("<div>Some new content</div>");
    });

    $('#tipChangeContent').smallipop({
        onAfterShow: function(trigger) {
            $.smallipop.setContent(trigger, "I'm the new content and I have replaced the old boring content!");
        },
        onBeforeHide: function(trigger) {
            $.smallipop.setContent(trigger, "Bye bye");
        }
    });

    $('#tipCSSAnimated').smallipop({
        cssAnimations: {
            enabled: true,
            show: 'animated bounceInDown',
            hide: 'animated hinge'
        }
    });

    $('#tipCSSAnimated2').smallipop({
        cssAnimations: {
            enabled: true,
            show: 'animated flipInX',
            hide: 'animated flipOutX'
        }
    });

    $('#tipCSSAnimated3').smallipop({
        cssAnimations: {
            enabled: true,
            show: 'animated fadeInLeft',
            hide: 'animated fadeOutRight'
        }
    });

    $('#tipCSSAnimated4').smallipop({
        cssAnimations: {
            enabled: true,
            show: 'animated rotateInDownLeft',
            hide: 'animated rotateOutUpRight'
        }
    });

    $('#tipDontHideOnTriggerClick').smallipop({
        hideOnTriggerClick: false
    });
    $('#tipDontHideOnContentClick').smallipop({
        hideOnPopupClick: false
    });

    $('.smallipopTour').smallipop({
        theme: 'black',
        cssAnimations: {
            enabled: true,
            show: 'animated flipInX',
            hide: 'animated flipOutX'
        }
    });

    $('#runTour').click(function() {
        $('.smallipopTour').smallipop('tour');
    });

    // Animate smallipops when scrolling
    if ($('.wobbler').length) {
        $(document).scroll(function() {
            var wobblers = $('.wobbler:not(.wobble)'),
                win = $(window);
            wobblers.each(function() {
                var self = $(this);
                offset = self.offset();
                if (offset.top > win.scrollTop() + 50 && offset.top < win.scrollTop() - 50 + win.height())
                    self.addClass('wobble');
            })
        }).trigger('scroll');
    }
});
