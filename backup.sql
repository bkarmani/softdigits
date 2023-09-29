PGDMP     0                    {         
   e-commerce    15.4    15.4 2    3           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            4           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            5           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            6           1262    24576 
   e-commerce    DATABASE     �   CREATE DATABASE "e-commerce" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "e-commerce";
                postgres    false            7           0    0    DATABASE "e-commerce"    COMMENT     B   COMMENT ON DATABASE "e-commerce" IS 'website for nelson mandela';
                   postgres    false    3382            �            1259    24831    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            �            1259    24839 	   cart_item    TABLE     �   CREATE TABLE public.cart_item (
    id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer
);
    DROP TABLE public.cart_item;
       public         heap    postgres    false            �            1259    24838    cart_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.cart_item_id_seq;
       public          postgres    false    222            8           0    0    cart_item_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.cart_item_id_seq OWNED BY public.cart_item.id;
          public          postgres    false    221            �            1259    24809 
   categories    TABLE     e   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(60) NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    24808    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    217            9           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    216            �            1259    24818    products    TABLE     �  CREATE TABLE public.products (
    id integer NOT NULL,
    product_name character varying(60) NOT NULL,
    description character varying(200) NOT NULL,
    image1 character varying(200) NOT NULL,
    image2 character varying(200) NOT NULL,
    image3 character varying(200) NOT NULL,
    image4 character varying(200) NOT NULL,
    old_price character varying(10) NOT NULL,
    price character varying(10) NOT NULL,
    category_id integer
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    24817    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    219            :           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    218            �            1259    24856    subscribers    TABLE     g   CREATE TABLE public.subscribers (
    id integer NOT NULL,
    email character varying(65) NOT NULL
);
    DROP TABLE public.subscribers;
       public         heap    postgres    false            �            1259    24855    subscribers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subscribers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.subscribers_id_seq;
       public          postgres    false    224            ;           0    0    subscribers_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.subscribers_id_seq OWNED BY public.subscribers.id;
          public          postgres    false    223            �            1259    24801    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(40),
    username character varying(40) NOT NULL,
    password_hash character varying(150)
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    24800    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    215            <           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    214            �           2604    24842    cart_item id    DEFAULT     l   ALTER TABLE ONLY public.cart_item ALTER COLUMN id SET DEFAULT nextval('public.cart_item_id_seq'::regclass);
 ;   ALTER TABLE public.cart_item ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            ~           2604    24812    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217                       2604    24821    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    24859    subscribers id    DEFAULT     p   ALTER TABLE ONLY public.subscribers ALTER COLUMN id SET DEFAULT nextval('public.subscribers_id_seq'::regclass);
 =   ALTER TABLE public.subscribers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            }           2604    24804    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            ,          0    24831    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    220   �6       .          0    24839 	   cart_item 
   TABLE DATA           F   COPY public.cart_item (id, user_id, product_id, quantity) FROM stdin;
    public          postgres    false    222   
7       )          0    24809 
   categories 
   TABLE DATA           .   COPY public.categories (id, name) FROM stdin;
    public          postgres    false    217   '7       +          0    24818    products 
   TABLE DATA           �   COPY public.products (id, product_name, description, image1, image2, image3, image4, old_price, price, category_id) FROM stdin;
    public          postgres    false    219   s8       0          0    24856    subscribers 
   TABLE DATA           0   COPY public.subscribers (id, email) FROM stdin;
    public          postgres    false    224   J       '          0    24801    user 
   TABLE DATA           D   COPY public."user" (id, email, username, password_hash) FROM stdin;
    public          postgres    false    215   
K       =           0    0    cart_item_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.cart_item_id_seq', 1, false);
          public          postgres    false    221            >           0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 20, true);
          public          postgres    false    216            ?           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 32, true);
          public          postgres    false    218            @           0    0    subscribers_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.subscribers_id_seq', 72, true);
          public          postgres    false    223            A           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 6, true);
          public          postgres    false    214            �           2606    24835 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    220            �           2606    24844    cart_item cart_item_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_pkey;
       public            postgres    false    222            �           2606    24816    categories categories_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_name_key;
       public            postgres    false    217            �           2606    24814    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    217            �           2606    24825    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    219            �           2606    24863 !   subscribers subscribers_email_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_email_key UNIQUE (email);
 K   ALTER TABLE ONLY public.subscribers DROP CONSTRAINT subscribers_email_key;
       public            postgres    false    224            �           2606    24861    subscribers subscribers_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.subscribers DROP CONSTRAINT subscribers_pkey;
       public            postgres    false    224            �           2606    24806    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    215            �           2606    24837    user user_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_username_key;
       public            postgres    false    215            �           1259    24807    ix_user_email    INDEX     H   CREATE UNIQUE INDEX ix_user_email ON public."user" USING btree (email);
 !   DROP INDEX public.ix_user_email;
       public            postgres    false    215            �           2606    24845 #   cart_item cart_item_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);
 M   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_product_id_fkey;
       public          postgres    false    222    3212    219            �           2606    24850     cart_item cart_item_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 J   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_user_id_fkey;
       public          postgres    false    215    222    3204            �           2606    24826 "   products products_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_category_id_fkey;
       public          postgres    false    219    3210    217            ,      x�3601I�0J5464����� %�|      .      x������ � �      )   <  x�UR�n�0=�_�/�;GD#�T*� �ҋqFtT/��qR5������s6$^�T�΢
|�^��m��*|�N�N�=X�2��B�Z<c�/)_�9{��WD{'��b��颒Z��ӡ�?	6�%;�:e��+v":c%j;�Ļ��d������E�()��!�G�`߰
T�-�J��u��SL��6�p��`��qo0~���F�Q��![�4y�n����9�8Kpz���**68�To��yC�x����`��d:�r��@�}3a$��[�(К�<hr�s��?����������+�������ǣ      +      x��Z[oG�|�Ec!�峄�_�dI��؎)��З��X)�"K��[͛帽�ap8�t�gꜪ:m12�l����0��q����dBy1����r~����\=��l��'�>�kv7��Ő�]�7�8�k��䌝�l�9�~�nF���v�q9���d�ƏN��R�Ze��V��7*�`b�VJy��������>Q���</��HEWQ���ˤLJ2�,��Q.ZcDV���y�y ^T�I&kBg���}!��-�W)���zj�Y����S����#��ɑ}qa{1�X��j�#B4fob��߳�ͅ9�e6�$�ҴŬ3�p>��4~d/q��,�z��>�	�؎NC�^+���X��6�M���⪳^m���
FjSr�NkǵH9�H�3ǆʵ�A�hu:T�V���B�ԙ\��I)�&A�[Uc�^����g�g��8ogܭ΄x�GäL��8�����,M�H��r��`9Ή]O�s���������fw��2� ���d1���u�������H\��h��=�	�*.�/Z*3z�K!�*���9��T�����Te�AI.�Ρ�ם9��G9B�p��u�yN:�ZH$��"�EUh9���a�E��b�N��-F��'v?/����WcVQ�:+�����x��2U��8������I�R�
�SQ�써F欲K�vt(� ������j��Y�2W��zsl(9y)�� '�@��(�;Q;��眇oZt��z��fqR�-�ayˎ_�b��o�go֟�!��ۨ�M?!W��=�ѓ5UH[�.�Fg���ϒ�������%]�����8x`�0;�F)��e
B�<"x��$"��W$	�B�_:��jG�0���2�T-
�7���{Z��]��È�@kU��UoU�F��>�K��;��e�`�9�<'��6��K�x��z�y-��O꡽>o~r"�B�ԡb��:�H�����ˤo�e���		*�> $HgԸ?����|� $C�Fy���+�G�i���f0�>S���H�OLt;��̴3��vEꛉk���McbZ��W2>y<>d���'���@��q���P>�

i�	�ާZ�	���\�^�J5�(�&��+����Ō�R�_�*�(�@Q�,�I��J�ҹWY0���>CŖc����Z؀�݇�)��O�ѐ���@���VA �D� �<Vbs�(�\ܴ�>���4"j�d��KĝrAu\GM���6\eQ�<p4F�fa���;s*4
�.��h���	)
����s��s���|nB�DM��Z�N��
Bx���M�5�qg�S���1g��n=e%P�rA�\��2�CL�
��29��A/:�Jۊ��(���
���w��Z��:!J` ��4B烔E�!� �L���AV�I��0&���9�9&�c���Mq�|�C���K����u�]���/��D�A8'����	{M� ��c�Ӌ��O���������������߽���/����z���wm�#��/.����Q��ϛ�����q>�>��>]&wS��f�����'=�ܒ�0ې�������.ත�����-�$���!x�����b�Ȏ���P�"���8��[A�Y��@.��qN�'�@`ԡ��@\�y��V�`���a3�*����G��`�K$��^�Zzg-$�����Q�U.�`w�k�d�� v�ڎ��������Fo����кXi��v��F�dBI�l�R��Z�y~siۏ��c�h��_L@�.���ڶ� aS)�AZM)ަ�b�<��S��4ҖX�	VꧩU漆��Й����
�e�&C�W��Mv��pQ�b�y	R�
�jP\
�+g��+��N�	�	9<\P�"l�����ҷ�rH���,��=N�O����	�/��op�K-�� �$M%ܩ�H%�P���O
" oو8�;y!
e�6 ��3��� ">A6ńg��ӐRpi�G(1�rQ,�1Ȕ���0hD:�e�P���:~�`�����OWl>����e�a< nAd���b�L� tw2-�e�k'l��{MPT�>C�5�(�Mlag����ේ���T��@�����CQ;�)�@�kh�#mM!�A8PD��9�aP�v��5dB�1ϡ �!j�95ɨ��Q��`�����T��5Y�?;T�̺���4����eBa�	��fxh5�ן^�o?n1<�O͜\�(.֍��ҥF�Z"�����ގ!��
7�h�J�f(��B�	�NX?R.��9�B��07�:�<��(B�!y@I����y�z�� ��oEY��Μ=#7�p����*�k����gq:��ɲ��F��*���.w��{z���,�(�VdDn��� 	nl���j*O��R1TV�B��oފ�m���Da?�x�5ƈ@X��%���X�k�c�<�T�p�B��K*5����ܩ^�E�Uܴ9����ng !{u�^?itG��Րm?ew�S�q�����F���&�Ao#9�C'_@3��x�P�"/�r(��)K�ْ Uݚ[F���n&�m8Jet ���9,��@Ӑ���i���ˬ����}�Y��>��m�+�?��1/����P-E%t���/������|�|-���8.�9{7���9���.(82E��z�s�.�jx�m�^�YJ�*-���OI)jv{I�T�:�h���̌���,��<� 0^ �ܺX���b�#�Y��<J�t�Y�6�E��w ���A ��L��t҂�(��4)�G'�lQ*춵�\���b�o' !2�uo��2���+*�.�@)�b�v�HWx�Ơ�9:�R�z�
=R]�j4r[U	W�H����H����� ���z�\�&�T���3�x�|rpa� # e3�i.^J��%��F1��	�5�#D|�\5[8��|$��߂7�~�/�t�O��r3��Y���F����������1lln�J	4ַ��2g+�6��O�H�D(Z��m��A1�J-�05�w�j�Q=)OIj���lp�*|#�Ȧd��́q<�A�Fd
<y�EHS��̅n{�m�5�_\��x�~ƛ����vK;�7g���r`�<��������ES�ݻ�k=���X�hD��E�#/BX��j%ךnza��,ٔ�`���Q8T�BKb+��<)��BK�hA�H�2(�&#�iϧ�FS�i�i���TӔIlE.��~ƞ=֎m/F�^��c�7l<\]/FG�Ož<ڒ����|APs�����l�B�|�j�\��T��:V��i0eD���i�${ �.	S �lHQ�+�Ñ���=[ct�<��� ��8%.�t�5%��;��T{0ct��赁J�V���U��=��J�e�fVa;_�Z{6]l�v���Cֻ|L�CnJi}�p6�y���-f�V4��˖����]�&kJk���JɅ%$uۈ�Oڈ���P�yo�z������Wz����ʪ� LuR�T�!���n�����Q\��vC.�T��uG����j�hG���o6�gӻ��`/�s$��Iu���FIM��+)��A5AoBG��x��y�wϻ��`c����І�������i�!�!0 ��&*���9��}��Φ�)Ր`f+|��+!����
�4�Ԏ��Olܷ�����i�g��L{��;{/H��2 eQU�s�Y���\Hᔬ�����ƏG�U�68�08���s��������΁}��;�3)$b�7�N�È�K�d5����Œ��:BjOm�8۵����ifo;�����j�`U�ԧ㖭�G��m_��Ya `k�E�\��r*=�:Y}U9y��d6�(	��W6)�3����z�4��<R.B��hT���!i���-���/�q���?��n�'��}��������؄1�MS�m��]����׍��;�'�x������&p���{1���9�*�������%�N��:�	�Dd@�4	��u��E�Z���
���hה��{�p��ge\v�m��ИW&�Q�  <�^�3#�Q��!|�(�	*ܝ�[��ԅ����3� �  �'U���ȯ�adOΝ0f����>?z˟������	;g����������S�-� Q�k��Q`Q��z`�?{E��B�{� ��&2	iW�r������9�8�bW*�L������9G
p4P�P��C�a~+=�Iӡ�=Ԉ����n�*1���=]7��=;i{U�L:s����	[�ޭ�W��t<�Ô���{���C�i�����v����*�~���j�4� 9\�L�Oϐ�RH� E��m2
o��)�}�xؙ���={b�ת������q��o��VФ�M��Ϥd/�M@�Y���U��4$	�+% ������5� U����>��G�
�@�*>�J2M��_I���-:�����
��o]\�s+��zN�����4?�R�ޠ^�:x���� vpG�      0   �   x�e��n� ����D	i���2��aJbW&Q�=�H�i�v{>��Co:��x'�E8�٥�<7����.��O)(6�#!A}��h���9���x~:d���8	Xy������0E�?��Oq�خ�h������ofa��X��n����a�E:�ŭ�V��~-/�j�����J֠n�5�ר�a;EX���&]��L�����X�m�o�_��6M��w�$      '   �   x�m���0 k��	���ђ����xrH���įW:�ܙ�Y�&X��qe\������%���[���Y���ldy�퐺ǘ./���r�R�V��\)Zi��i�@[�XY��b�V�7�8�5�P;�Hݷ#�X�Wx�uK?�mߒ� �| �=�     