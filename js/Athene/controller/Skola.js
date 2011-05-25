Ext.define('Athene.controller.Skola', {
    extend: 'Ext.app.Controller',
    
    views: [
        'skola.List',
        'skola.Form'
    ],
    
    stores: [
        'Skola'
    ],
    
    models: [
        'Skola'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#skolagrid'
        }
    ],
    
    init: function() {
        console.log('Skola controller initialized.')
        
        this.control({
            '#skolagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openSkolaForm': {
                click: function() {
                    var view = Ext.widget('skolaform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        console.log('Grid is rendered, loading data...');
        this.getList().store.load();
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('skolaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#skolalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})