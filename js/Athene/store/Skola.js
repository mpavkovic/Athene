Ext.define('Athene.store.Skola', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Skola',
    proxy: {
        type: 'direct',
        directFn: Skola.getAll,
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