Ext.define('Athene.store.Poteskoca', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Poteskoca',
    proxy: {
        type: 'direct',
        directFn: Poteskoca.getAll,
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