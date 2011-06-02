Ext.define('Athene.view.Debug', {
    extend: 'Ext.window.Window',
    alias: 'widget.debugwindow',
    
    //autoShow: true,
    title: 'Debug',
    height: 200,
    width: 500,
    layout: 'fit',
    id: 'debugWindow',
    constrain: true,
    listeners: {
       afterrender: function(window) {
          console.log('Debug window rendered.');
          window.alignTo(this, 'br', [1, 5]);
       }
    },
    items: [
       {
          id: 'debugOutput',
          title: false,
          autoScroll: true,
          bodyStyle: 'padding: 5px',
          tpl: '{data}',
          tplWriteMode: 'append'
       }
    ],
    log: function(message) {
        console.log(this.down('#debugOutput'));
        Ext.getCmp('debugOutput').update({
            data: message
        });
    }
});

Ext.ComponentManager.registerType('debugwindow', Athene.view.Debug);

if(debug == true) {
    Ext.widget('debugwindow').show();
}