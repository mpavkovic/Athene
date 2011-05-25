Ext.define('Athene.controller.Poteskoca', {
    extend: 'Ext.app.Controller',
    
    views: [
        'poteskoca.List',
        'poteskoca.Form'
    ],
    
    stores: [
        'Poteskoca'
    ],
    
    models: [
        'Poteskoca'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#poteskocagrid'
        }
    ],
    
    init: function() {
        console.log('Poteskoca controller initialized.')
        
        this.control({
            '#poteskocagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openPoteskocaForm': {
                click: function() {
                    var view = Ext.widget('poteskocaform');
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
        var view = Ext.widget('poteskocaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#poteskocalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})