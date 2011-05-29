Ext.define('Athene.store.RazlogBoravista', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.RazlogBoravista',
    proxy: {
        type: 'direct',
        directFn: RazlogBoravista.getAll,
        reader: {
            root: 'data'
        }
    },
    sorters: [
        {
            property: 'opis'
        }
    ]
});