Ext.define('Athene.store.Narodnost', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Narodnost',
    proxy: {
        type: 'direct',
        directFn: Narodnost.getAll,
        reader: {
            root: 'data'
        }
    },
    sorters: [
        {
            property: 'naziv'
        }
    ]
});