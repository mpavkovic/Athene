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
            }
        });
    },
    
    onGridRendered: function() {
        this.getList().store.load();
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('zanimanjeform');
        view.down('form').loadRecord(r);
        view.renderTo = '#zanimanjelist';
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})