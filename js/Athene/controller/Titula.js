Ext.define('Athene.controller.Titula', {
    extend: 'Ext.app.Controller',
    
    views: [
        'titula.List',
        'titula.Form'
    ],
    
    stores: [
        'Titula'
    ],
    
    models: [
        'Titula'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#titulagrid'
        }
    ],
    
    init: function() {
        console.log('Titula controller initialized.')
        
        this.control({
            '#titulagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openTitulaForm': {
                click: function() {
                    var view = Ext.widget('titulaform');
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
        var view = Ext.widget('titulaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#titulalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})