Ext.define('Athene.store.NajavaIspita', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.NajavaIspita',
    proxy: {
        type: 'direct',
        directFn: NajavaIspita.getAll
    },
    sorters: [
        {
            property: 'naziv'
        }
    ]
});