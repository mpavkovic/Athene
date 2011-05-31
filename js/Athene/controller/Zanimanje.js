Ext.define('Athene.controller.Zanimanje', {
    extend: 'Ext.app.Controller',
    
    views: [
        'zanimanje.List',
        'zanimanje.Form'
    ],
    
    stores: [
        'Zanimanje'
    ],
    
    models: [
        'Zanimanje'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#zanimanjegrid'
        }
    ],
    
    init: function() {
        
        this.control({
            '#zanimanjegrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openZanimanjeForm': {
                click: function() {
                    var view = Ext.widget('zanimanjeform');
                    view.show();
                }
            },
            '#refreshZanimanjeList': {
                click: this.refreshData
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getZanimanjeStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    edit: function(v, r) {
        var view = Ext.widget('zanimanjeform');
        view.down('form').loadRecord(r);
        view.renderTo = '#zanimanjelist';
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
    
    refreshData: function() {
        this.getZanimanjeStore().load();
    }
})