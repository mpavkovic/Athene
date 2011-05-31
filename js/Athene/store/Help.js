Ext.define('Athene.store.Help', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Help',
    proxy: {
        type: 'direct',
        directFn: Help.getAll,
        reader: {
            root: 'data'
        }
    },
    sorters: [
        {
            property: 'title'
        }
    ],
    listeners: {
        load: function() {
            //console.log('Loading data for Help store');
        }
    }
});