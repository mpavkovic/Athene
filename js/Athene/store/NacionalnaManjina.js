Ext.define('Athene.store.NacionalnaManjina', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.NacionalnaManjina',
    proxy: {
        type: 'direct',
        directFn: NacionalnaManjina.getAll,
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