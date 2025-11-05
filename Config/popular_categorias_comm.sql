-- ============================================================================
-- Script para popular a tabela categorias_comm com categorias padrão
-- Data: 05/11/2025
-- ============================================================================

-- Limpar tabela (caso queira repopular)
-- TRUNCATE TABLE categorias_comm RESTART IDENTITY CASCADE;

-- Inserir categorias de estabelecimentos comerciais
INSERT INTO categorias_comm (nome_categoria_comm) VALUES
    ('Restaurantes'),
    ('Lanchonetes'),
    ('Pizzarias'),
    ('Hamburguerias'),
    ('Padarias'),
    ('Açougues'),
    ('Mercados'),
    ('Farmácias'),
    ('Pet Shops'),
    ('Lojas de Roupas'),
    ('Lojas de Calçados'),
    ('Lojas de Eletrônicos'),
    ('Lojas de Móveis'),
    ('Floriculturas'),
    ('Bares e Pubs'),
    ('Cafeterias'),
    ('Sorveterias'),
    ('Docerias'),
    ('Sushi'),
    ('Comida Italiana'),
    ('Comida Japonesa'),
    ('Comida Chinesa'),
    ('Comida Mexicana'),
    ('Comida Árabe'),
    ('Churrascarias'),
    ('Pastelarias'),
    ('Tapiocarias'),
    ('Açaí')
ON CONFLICT DO NOTHING;

-- Verificar categorias inseridas
SELECT * FROM categorias_comm ORDER BY id_categoria;
