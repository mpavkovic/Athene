Ext.define('Athene.controller.Narodnost', {
    extend: 'Ext.app.Controller',
    
    views: [
        'narodnost.List',
        'narodnost.Form'
    ],
    
    stores: [
        'Narodnost'
    ],
    
    models: [
        'Narodnost'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#narodnostgrid'
        }
    ],
    
    init: function() {
        //console.log('Narodnost controller initialized.')
        
        this.control({
            '#narodnostgrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openNarodnostForm': {
                click: function() {
                    var view = Ext.widget('narodnostform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getNarodnostStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('narodnostform');
        view.down('form').loadRecord(r);
        view.renderTo = '#narodnostlist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
	
    refreshData: function() {
        this.getNarodnostStore().load();
    }
})