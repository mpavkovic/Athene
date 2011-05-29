Ext.define('Athene.controller.Ucenik', {
    extend: 'Ext.app.Controller',
    
    views: [
        'ucenik.List',
        'ucenik.Form'
    ],
    
    stores: [
        'Ucenik'
    ],
    
    models: [
        'Ucenik'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#ucenikgrid'
        }
    ],
    
    init: function() {
        console.log('Ucenik controller initialized.')
        
        this.control({
            '#ucenikgrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openUcenikForm': {
                click: function() {
                    var view = Ext.widget('ucenikform');
                    view.show();
                }
            },
            '#openUcenikGrid': {
                click: function() {
                    Ext.widget('uceniklist').show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        console.log('Grid is rendered, loading data...');
        this.getUcenikStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('ucenikform');
        view.down('form').loadRecord(r);
        view.renderTo = '#uceniklist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})