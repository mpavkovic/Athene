Ext.define('Athene.view.Help', {
    extend: 'Ext.window.Window',
    alias: 'widget.helpwindow',
    id: 'helpwindow',
    
    title: 'Pomoć: ',
    layout: 'fit',
    bodyCls: 'helpwindow',
    padding: 5,
    width: 670,
    height: 300,
    maximizable: true,
    constrain: true,
	autoScroll:true
});