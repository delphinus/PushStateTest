;'use strict';

(function($){$(document).ready(function(){


var Page = function(){};
Page.prototype = { //{{{

    opt: { //{{{
        $list: $('#list') // pjax で書き換える表
        ,$pjaxLink: $('[rel=pjax]') // pjax 遷移するリンク
        ,$pjaxOnDialog: $('#dg-on')
        ,$pjaxOffDialog: $('#dg-off')
        ,dialog: {
            modal: true
            ,dialogClass: 'shadow'
            ,buttons: { OK: function() { $(this).dialog('close'); } }
        }
        ,buttons: [
            {id: 'pjaxOn', icon: 'ui-icon-check'}
            ,{id: 'pjaxOff', icon: 'ui-icon-close'}
        ]
    } //}}}

    // イニシャライザ
    ,init: function() { //{{{
        var self = this;

        // pjax 設定
        self.opt.$pjaxLink
            .button()
            .pjax(self.opt.$list)
        ;
        $(document).on('pjax:end', $.proxy(self.callbacks.pjaxEnd, self));

        // ボタン設定
        $.each(self.opt.buttons, function() {
            $('#' + this.id)
                .button({icons: {primary: this.icon}})
                .on('click', $.proxy(self.buttonFunc[this.id], self))
            ;
        });

        return self;
    } //}}}

    // コールバック
    ,callbacks: { //{{{

        // pjax 遷移が終わったら起動
        pjaxEnd: function(e) {
            var self = this
                ,$target = $(e.target)
            ;

            // 書き換わった範囲を一瞬明るくする
            $target
                .css({backgroundColor: 'wheat'})
                .animate({backgroundColor: 'white'}, 500)
            ;

            return self;
        }

    } //}}}

    // ボタン用のコールバック
    ,buttonFunc: {
        pjaxOn: function() {
            var self = this;

            $.pjax.enable();
            self.opt.$pjaxOnDialog.dialog(self.opt.dialog);
        }
        ,pjaxOff: function() {
            var self = this;

            $.pjax.disable();
            self.opt.$pjaxOffDialog.dialog(self.opt.dialog);
        }
    }

}; //}}}

window.p = (new Page).init();


});})(jQuery);
