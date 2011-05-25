Ext.define('Athene.controller.Ocjena', {
    extend: 'Ext.app.Controller',
    
    views: [
        'ocjena.List',
        'ocjena.Form'
    ],
    
    stores: [
        'Ocjena'
    ],
    
    models: [
        'Ocjena'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#ocjenagrid'
        }
    ],
    
    init: function() {
        console.log('Ocjena controller initialized.')
        
        this.control({
            '#ocjenagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openOcjenaForm': {
                click: function() {
                    var view = Ext.widget('ocjenaform');
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
        var view = Ext.widget('ocjenaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#ocjenalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})