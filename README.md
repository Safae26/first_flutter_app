# Application Multi-Écrans Flutter

## Présentation du Projet
Cette application Flutter démontre l'implémentation de plusieurs fonctionnalités clés à travers 4 exercices distincts, intégrés dans une architecture multi-écrans avec navigation avancée.

## Stack Technologique
- **Framework**: Flutter 
- **Langage**: Dart 
- **Outils**: 
  - Flutter SDK
  - Dart DevTools
  - Android Studio


## Fonctionnalités Détaillées

### 1. Module de Formulaire d'Inscription
**Fichier**: `lib/screens/form_screen.dart`

| Composant               | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| FormValidation          | Validation en temps réel des champs avec RegExp                             |
| CustomTextFormField     | Widget réutilisable avec gestion d'erreurs                                  |
| ConfirmationDialog      | Popup modale affichant les données soumises                                 |
| SnackBarFeedback        | Notification contextuelle pour feedback utilisateur                         |

**Validations**:
- Email: `RegExp(r'^[^@]+@[^@]+\.[^@]+')`
- Mot de passe: Minimum 6 caractères

### 2. Module d'Interaction d'Image
**Fichier**: `lib/screens/image_interaction_screen.dart`

| Fonctionnalité         | Implémentation                                                              |
|------------------------|-----------------------------------------------------------------------------|
| Image aléatoire        | Intégration avec API HTTP (ex: picsum.photos)                               |
| Système de votes       | State management avec Provider/Bloc                                         |
| Commentaires           | Persistance locale avec Hive/SQLite                                         |
| UI réactive            | Animations avec Flutter AnimationController                                 |

### 3. Module de Liste Dynamique
**Fichier**: `lib/screens/list_screen.dart`

**Workflow**:
1. Saisie utilisateur via `TextField`
2. Ajout à la liste observable (`ValueNotifier`)
3. Sélection via `CheckboxListTile`
4. Suppression conditionnelle avec vérification

**Gestion d'erreurs**:
- Affichage d'un `SnackBar` lorsque suppression sans sélection

### 4. Système de Navigation
**Fichier**: `lib/main.dart`

| Navigation             | Implémentation                                                              |
|------------------------|-----------------------------------------------------------------------------|
| DrawerNavigation       | `Scaffold.drawer` avec routes nommées                                       |
| BottomNavigationBar    | PersistentState avec PageStorageBucket                                      |
| Thèmes                 | ThemeData par écran avec héritage via Theme.of(context)                     |

## Bonnes Pratiques Implementées
- Séparation claire des responsabilités (SOLID)
- Widgets réutilisables
- Gestion d'état optimisée
- UI responsive (LayoutBuilder)
- Accessibilité (Semantics)
- Internationalisation potentielle (i18n)

## Résultats : 
<img width="782" alt="1" src="https://github.com/user-attachments/assets/9f51479a-13e5-4cac-b16f-8789d28b6ba2" />
<img width="783" alt="11" src="https://github.com/user-attachments/assets/eff7b5ee-d0b4-44e6-9f53-87b9a0111dad" />
<img width="784" alt="2" src="https://github.com/user-attachments/assets/b9b86038-09dc-4baa-8a05-7b5672ee1c48" />
<img width="782" alt="3" src="https://github.com/user-attachments/assets/a6a2f1d6-80fa-4c4a-bd53-c3f96503271f" />
<img width="783" alt="4" src="https://github.com/user-attachments/assets/d575cc7c-28b4-4cf6-9c76-18aba35341b8" />
<img width="783" alt="5" src="https://github.com/user-attachments/assets/c29057b6-874a-42df-95d0-5dbff26aab97" />
<img width="782" alt="6" src="https://github.com/user-attachments/assets/ec3d5c44-9f67-4d9b-b620-c1c1ca120c42" />
<img width="783" alt="7" src="https://github.com/user-attachments/assets/74f41c34-6b6b-433f-a4c2-23e18f650a0a" />
<img width="782" alt="8" src="https://github.com/user-attachments/assets/3c826c84-bea1-495e-8537-4ec915b93a8e" />
<img width="782" alt="9" src="https://github.com/user-attachments/assets/fc1800be-93ca-4a01-99f1-6bae5d0984fa" />
<img width="782" alt="10" src="https://github.com/user-attachments/assets/e2f82d82-4de5-4356-9c10-612210ef0460" />
<img width="785" alt="12" src="https://github.com/user-attachments/assets/0ca3904c-ab99-4869-a4dd-8db473937ea5" />


## Auteur : **Safae ERAJI**
