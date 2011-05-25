Ext.define('Athene.store.VrstaPutnika', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.VrstaPutnika',
    proxy: {
        type: 'direct',
        directFn: VrstaPutnika.getAll
    },
    sorters: [
        {
            property: 'naziv'
        }
    ]
});