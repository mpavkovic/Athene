Ext.define('Athene.view.Tip', {
    extend: 'Ext.window.Window',
    alias: 'widget.tipwindow',
    id: 'tipwindow',
    
    title: 'Savjet dana: ',
    layout: 'fit',
    bodyCls: 'tipwindow',
    padding: 5,
    width: 300,
    height: 300,
    maximizable: false,
    constrain: true
    
});