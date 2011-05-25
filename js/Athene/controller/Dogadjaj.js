Ext.define('Athene.controller.Dogadjaj', {
    extend: 'Ext.app.Controller',
    
    views: [
        'dogadjaj.List',
        'dogadjaj.Form'
    ],
    
    stores: [
        'Dogadjaj'
    ],
    
    models: [
        'Dogadjaj'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#dogadjajgrid'
        }
    ],
    
    init: function() {
        
        this.control({
            '#dogadjajgrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openDogadjajForm': {
                click: function() {
                    var view = Ext.widget('dogadjajform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        this.getList().store.load();
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('dogadjajform');
        view.down('form').loadRecord(r);
        view.renderTo = '#dogadjajlist';
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})