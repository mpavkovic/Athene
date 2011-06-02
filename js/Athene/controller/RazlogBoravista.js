Ext.define('Athene.controller.RazlogBoravista', {
    extend: 'Ext.app.Controller',
    
    views: [
        'razlogboravista.List',
        'razlogboravista.Form'
    ],
    
    stores: [
        'RazlogBoravista'
    ],
    
    models: [
        'RazlogBoravista'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#razlogboravistagrid'
        }
    ],
    
    init: function() {
        //console.log('Razlog boravista controller initialized.')
        
        this.control({
            '#razlogboravistagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openRazlogBoravistaForm': {
                click: function() {
                    var view = Ext.widget('razlogboravistaform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getRazlogBoravistaStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('razlogboravistaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#razlogboravistalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
    refreshData: function() {
        this.getRazlogBoravistaStore().load();
    }
})