Ext.define('Athene.view.PopupMessage', {
    extend: 'Ext.window.Window',
    alias: 'widget.popupmessage',
    //id: 'popupmessage',
    
    //preventHeader: true,
    //autoShow: false,
    //floating: true,
    //hidden: true,
    header: false,
    closable: false,
    draggable: false,
    //frame: false,
    //frameHeader: false,
    border: false,
    bodyBorder: false,
    resizable: false,
    width: 300,
    padding: 0,
    bodyPadding: 5,
    layout: 'fit',
    shadow: false,
    bodyStyle: 'border: 0; border-radius: 5px; background-color: white;',
    html: 'Ovo je popup poruka!',
    listeners: {
        afterrender: function(window) {
            window.alignTo(Ext.getCmp('workspace'), 'tr-tr');
        },
        show: function(window) {
            window.getEl().fadeIn({
                duration: 2000
            }).fadeOut({
                duration: 1000,
                useDisplay: true,
                callback: function() {
                    window.hide();
                }
            });
        }
    },
    
    popup: function(message) {
        this.html = message;
        this.show();
    }
});

//Ext.ComponentManager.registerType('popupmessage', Athene.view.PopupMessage);