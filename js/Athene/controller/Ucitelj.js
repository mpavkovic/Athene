Ext.define('Athene.controller.Ucitelj', {
    extend: 'Ext.app.Controller',
    
    views: [
        'ucitelj.List',
        'ucitelj.Form'
    ],
    
    stores: [
        'Ucitelj'
    ],
    
    models: [
        'Ucitelj'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#uciteljgrid'
        }
    ],
    
    init: function() {
        console.log('Ucitelj controller initialized.');
        
        this.control({
            '#uciteljgrid': {
                render: this.onGridRendered
            },
            '#openUciteljForm': {
                click: function() {
                    var view = Ext.widget('uciteljform');
                    view.show();
                }
            },
            "form": {
                submit: function() {
                    console.log("Submiting form...");
                }
            }
        });
    },
    
    onGridRendered: function() {
        console.log('Grid is rendered, loading data...');
        this.getList().store.load();
    }
});