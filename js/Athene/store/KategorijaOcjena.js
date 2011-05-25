Ext.define('Athene.store.KategorijaOcjena', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.KategorijaOcjena',
    proxy: {
        type: 'direct',
        directFn: KategorijaOcjena.getAll
    },
    sorters: [
        {
            property: 'naziv'
        }
    ]
});