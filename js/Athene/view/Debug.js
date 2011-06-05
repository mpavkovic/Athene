Ext.define('Athene.view.Debug', {
    extend: 'Ext.window.Window',
    alias: 'widget.debugwindow',
    
    title: 'Debug',
    height: 200,
    width: 500,
    layout: 'fit',
    maximizable: true,
    id: 'debugWindow',
    constrain: true,
    listeners: {
        afterrender: function(window) {
            window.alignTo(this, 'br', [1, 5]);
        }
    },
    items: [
        {
            id: 'debugOutput',
            messageCount: 0,
            title: false,
            autoScroll: true,
            bodyStyle: 'padding: 5px',
            tpl: '<div class="debugMessage"><b>{title}</b> - {message}<br />in file <span class="file">{file}</span> on line <span class="line">{line}</span><br />Trace: <pre>{trace}</pre></div>',
            tplWriteMode: 'append',
            listeners: {
                
            }
        }
    ],
    log: function(message) {
        console.log(this.down('#debugOutput'));
        Ext.getCmp('debugOutput').update({
            data: message
        });
    },
    dockedItems: [
        {
            xtype: 'toolbar',
            dock: 'bottom',
            items: [
                '->', {
                    xtype: 'tbtext',
                    text: 'No messages',
                    tpl: 'Total messages: {msg_count}'
                }
            ]
        }
    ]
});

Ext.ComponentManager.registerType('debugwindow', Athene.view.Debug);