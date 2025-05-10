---
title: ポケモンで学ぶJavaのループ処理 - for文と拡張for文、2重ループを避けるテクニック
tags:
  - Java入門
  - プログラミング初心者
  - ポケモン
private: false
updated_at: '2025-05-09T11:49:59+09:00'
id: bb89d1ae92caa0cc3c8b
organization_url_name: null
slide: false
ignorePublish: false
---
# 🌟 ポケモンで学ぶJavaのループ処理 - for文と拡張for文、2重ループを避けるテクニック

ポケモントレーナーの皆さん、こんにちは！
今日はJavaプログラミングの中でも特に重要な **繰り返し処理（ループ）** について、ポケモンの世界を例に学んでいきましょう。

---

## 🔖 目次

* 🌀 [1. 基本的なfor文とは](#1-基本的なfor文とは)
* 🔁 [2. 拡張for文（forEach）とは](#2-拡張for文foreachとは)
* ⚔️ [3. for文と拡張for文の違い](#3-for文と拡張for文の違い)
* 🛠️ [4. ポケモンプログラムでの実践例](#4-ポケモンプログラムでの実践例)
* 🧠 [5. 2重ループを避けるテクニック](#5-2重ループを避けるテクニック)
* 📝 [6. まとめ](#6-まとめ)


## 1. 基本的なfor文とは

基本的な`for文`は、初期化、条件、増減処理の3つの部分から構成されています。

```java
// 基本的なfor文の構文
for (初期化; 条件; 増減) {
    // 繰り返し実行したい処理
}
```

例えば、手持ちのポケモン（最大6匹）をすべて表示するコードは次のようになります：

```java
public class PokemonTeam {
    public static void main(String[] args) {
        String[] myPokemon = {"ピカチュウ", "リザードン", "ミュウツー", "ゲンガー", "カイリュー", "ミミッキュ"};
        
        // 基本的なfor文でポケモンを表示
        System.out.println("【手持ちポケモン一覧】");
        for (int i = 0; i < myPokemon.length; i++) {
            System.out.println((i + 1) + "番目: " + myPokemon[i]);
        }
    }
}
```

このコードでは、配列のインデックスを使って各ポケモンにアクセスしています。`i`という変数が0から始まり、配列の長さ未満である間、1ずつ増加しながら繰り返し処理を行います。

## 2. 拡張for文（forEach）とは

Java 5から導入された`拡張for文`（別名：forEach）は、コレクションや配列の要素に対して、よりシンプルに処理を行うことができます。

```java
// 拡張for文の構文
for (要素の型 変数名 : 配列やコレクション) {
    // 各要素に対する処理
}
```

先ほどの手持ちポケモンの例を拡張for文で書き直すと：

```java
public class PokemonTeamForEach {
    public static void main(String[] args) {
        String[] myPokemon = {"ピカチュウ", "リザードン", "ミュウツー", "ゲンガー", "カイリュー", "ミミッキュ"};
        
        // 拡張for文でポケモンを表示
        System.out.println("【手持ちポケモン一覧】");
        for (String pokemon : myPokemon) {
            System.out.println(pokemon);
        }
    }
}
```

## 3. for文と拡張for文の違い

### メリット比較

| 機能 | 基本for文 | 拡張for文 |
|------|-----------|-----------|
| インデックス操作 | ○（自由に扱える） | ×（直接扱えない） |
| コードの簡潔さ | △（やや冗長） | ○（シンプル） |
| 要素の変更 | ○（可能） | △（参照型のみ可能） |
| パフォーマンス | ○（基本的に同等） | ○（基本的に同等） |
| 要素の追加・削除 | ○（可能） | ×（不可） |

### 基本for文のメリット

ポケモンバトルを例に考えてみましょう：

```java
public class PokemonBattle {
    public static void main(String[] args) {
        String[] myPokemon = {"ピカチュウ", "リザードン", "ミュウツー", "ゲンガー", "カイリュー", "ミミッキュ"};
        int[] hpValues = {70, 100, 120, 60, 90, 55};
        
        // 基本for文の利点：インデックスを活用できる
        for (int i = 0; i < myPokemon.length; i++) {
            System.out.println(myPokemon[i] + "のHP: " + hpValues[i]);
            
            // HPが低いポケモンには回復アイテムを使用
            if (hpValues[i] < 70) {
                hpValues[i] += 30; // 要素の値を変更
                System.out.println(myPokemon[i] + "にキズぐすりを使った！HPが30回復した！");
                System.out.println("現在のHP: " + hpValues[i]);
            }
        }
    }
}
```

このように、基本for文では：
- インデックス（`i`）を使って、複数の配列を同時に操作できる
- 配列の要素を直接変更できる
- 特定の条件に基づいて一部の要素だけを処理できる

### 拡張for文のメリット

ポケモン図鑑の例で考えてみましょう：

```java
import java.util.ArrayList;
import java.util.List;

class Pokemon {
    String name;
    String type;
    
    Pokemon(String name, String type) {
        this.name = name;
        this.type = type;
    }
    
    @Override
    public String toString() {
        return name + " (タイプ: " + type + ")";
    }
}

public class Pokedex {
    public static void main(String[] args) {
        // ポケモン図鑑用のリスト
        List<Pokemon> pokedex = new ArrayList<>();
        pokedex.add(new Pokemon("ピカチュウ", "でんき"));
        pokedex.add(new Pokemon("リザードン", "ほのお/ひこう"));
        pokedex.add(new Pokemon("ミュウツー", "エスパー"));
        pokedex.add(new Pokemon("ゲンガー", "ゴースト/どく"));
        
        // 拡張for文の利点：シンプルに全要素にアクセスできる
        System.out.println("【ポケモン図鑑】");
        for (Pokemon pokemon : pokedex) {
            System.out.println(pokemon); // toStringメソッドが呼ばれる
        }
    }
}
```

拡張for文では：
- コードがシンプルで読みやすい
- 要素自体に直接アクセスできる
- インデックスを気にせず、コレクションの全要素を処理できる

## 4. ポケモンプログラムでの実践例

### 例1: ポケモンのタイプ別集計

```java
import java.util.HashMap;
import java.util.Map;

public class PokemonTypeCounter {
    public static void main(String[] args) {
        // ポケモンとそのタイプの配列
        String[] pokemon = {"ピカチュウ", "リザードン", "フシギダネ", "ゼニガメ", "イーブイ", "カイリュー"};
        String[] types = {"でんき", "ほのお", "くさ", "みず", "ノーマル", "ドラゴン"};
        
        // タイプごとの出現回数を記録するマップ
        Map<String, Integer> typeCounts = new HashMap<>();
        
        // 基本for文：2つの配列を同時に処理
        for (int i = 0; i < pokemon.length; i++) {
            String type = types[i];
            // マップにタイプがなければ追加、あれば値を1増やす
            typeCounts.put(type, typeCounts.getOrDefault(type, 0) + 1);
        }
        
        // 拡張for文：結果の表示
        System.out.println("【タイプ別ポケモン数】");
        for (Map.Entry<String, Integer> entry : typeCounts.entrySet()) {
            System.out.println(entry.getKey() + "タイプ: " + entry.getValue() + "匹");
        }
    }
}
```

### 例2: 効率的なポケモン検索

```java
import java.util.ArrayList;
import java.util.List;

class PokemonData {
    String name;
    String type;
    int power;
    
    PokemonData(String name, String type, int power) {
        this.name = name;
        this.type = type;
        this.power = power;
    }
}

public class PokemonFinder {
    public static void main(String[] args) {
        // ポケモンデータのリスト作成
        List<PokemonData> allPokemon = new ArrayList<>();
        allPokemon.add(new PokemonData("ピカチュウ", "でんき", 55));
        allPokemon.add(new PokemonData("リザードン", "ほのお", 84));
        allPokemon.add(new PokemonData("フシギダネ", "くさ", 49));
        allPokemon.add(new PokemonData("ゲンガー", "ゴースト", 65));
        allPokemon.add(new PokemonData("カイリュー", "ドラゴン", 95));
        
        // パワーが一定値以上のポケモンを検索（基本for文）
        int powerThreshold = 70;
        System.out.println("【パワー" + powerThreshold + "以上のポケモン】");
        for (int i = 0; i < allPokemon.size(); i++) {
            PokemonData pokemon = allPokemon.get(i);
            if (pokemon.power >= powerThreshold) {
                System.out.println((i + 1) + "番目: " + pokemon.name + " (パワー: " + pokemon.power + ")");
            }
        }
        
        // 特定のタイプのポケモンを検索（拡張for文）
        String searchType = "でんき";
        System.out.println("\n【" + searchType + "タイプのポケモン】");
        for (PokemonData pokemon : allPokemon) {
            if (pokemon.type.equals(searchType)) {
                System.out.println(pokemon.name + " (パワー: " + pokemon.power + ")");
            }
        }
    }
}
```

## 5. 2重ループを避けるテクニック

ポケモンバトルのシミュレーションなどでは2重ループが使われることがありますが、パフォーマンス向上のために2重ループを避ける方法を紹介します。

### 悪い例：2重ループを使ったタイプ相性チェック

```java
public class PokemonTypeMatchup_Bad {
    public static void main(String[] args) {
        String[] myPokemon = {"ピカチュウ", "リザードン", "フシギダネ"};
        String[] myTypes = {"でんき", "ほのお", "くさ"};
        
        String[] enemyPokemon = {"ゼニガメ", "カイリュー", "ゲンガー", "サンド"};
        String[] enemyTypes = {"みず", "ドラゴン", "ゴースト", "じめん"};
        
        // 2重ループによる全組み合わせチェック（非効率）
        System.out.println("【タイプ相性チェック】");
        for (int i = 0; i < myPokemon.length; i++) {
            for (int j = 0; j < enemyPokemon.length; j++) {
                // 相性チェック（本来は複雑なロジックがここに入る）
                boolean effective = isEffective(myTypes[i], enemyTypes[j]);
                System.out.println(myPokemon[i] + " vs " + enemyPokemon[j] + ": " + 
                                  (effective ? "効果抜群！" : "普通の効果"));
            }
        }
    }
    
    private static boolean isEffective(String attackType, String defenseType) {
        // 簡易的な相性判定ロジック（実際はもっと複雑）
        if (attackType.equals("でんき") && defenseType.equals("みず")) return true;
        if (attackType.equals("ほのお") && defenseType.equals("くさ")) return true;
        if (attackType.equals("みず") && defenseType.equals("ほのお")) return true;
        // じめんタイプはでんきタイプの技を無効化
        if (attackType.equals("でんき") && defenseType.equals("じめん")) return false;
        return false;
    }
}
```

### 良い例：マップを使って2重ループを避ける

```java
import java.util.HashMap;
import java.util.Map;

public class PokemonTypeMatchup_Good {
    public static void main(String[] args) {
        // タイプ相性マップを事前に作成
        Map<String, Map<String, String>> typeEffectiveness = new HashMap<>();
        
        // でんきタイプの相性
        Map<String, String> electricEffects = new HashMap<>();
        electricEffects.put("みず", "効果抜群！");
        electricEffects.put("じめん", "効果なし");
        electricEffects.put("ドラゴン", "あまり効果がない");
        typeEffectiveness.put("でんき", electricEffects);
        
        // ほのおタイプの相性
        Map<String, String> fireEffects = new HashMap<>();
        fireEffects.put("くさ", "効果抜群！");
        fireEffects.put("みず", "あまり効果がない");
        fireEffects.put("ドラゴン", "あまり効果がない");
        typeEffectiveness.put("ほのお", fireEffects);
        
        // バトルシミュレーション
        String[] myPokemon = {"ピカチュウ", "リザードン"};
        String[] myTypes = {"でんき", "ほのお"};
        String[] enemyPokemon = {"ゼニガメ", "カイリュー", "サンド"};
        String[] enemyTypes = {"みず", "ドラゴン", "じめん"};
        
        System.out.println("【効率的なタイプ相性チェック】");
        
        // 1つのループで必要な情報だけを効率的にチェック
        for (int i = 0; i < myPokemon.length; i++) {
            String myType = myTypes[i];
            System.out.println("\n" + myPokemon[i] + "(" + myType + "タイプ)の相性:");
            
            Map<String, String> effectiveness = typeEffectiveness.get(myType);
            if (effectiveness != null) {
                for (int j = 0; j < enemyPokemon.length; j++) {
                    String enemyType = enemyTypes[j];
                    String effect = effectiveness.getOrDefault(enemyType, "普通の効果");
                    System.out.println(" vs " + enemyPokemon[j] + "(" + enemyType + "タイプ): " + effect);
                }
            }
        }
    }
}
```

### Stream APIを使った効率的な処理

Java 8以降では、Stream APIを使って繰り返し処理をより簡潔に書くことができます：

```java
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

class PokemonInfo {
    String name;
    String type;
    int hp;
    int attack;
    
    PokemonInfo(String name, String type, int hp, int attack) {
        this.name = name;
        this.type = type;
        this.hp = hp;
        this.attack = attack;
    }
    
    @Override
    public String toString() {
        return name + " (" + type + "タイプ, HP:" + hp + ", 攻撃力:" + attack + ")";
    }
}

public class PokemonStreamExample {
    public static void main(String[] args) {
        List<PokemonInfo> pokemonList = Arrays.asList(
            new PokemonInfo("ピカチュウ", "でんき", 35, 55),
            new PokemonInfo("リザードン", "ほのお", 78, 84),
            new PokemonInfo("フシギダネ", "くさ", 45, 49),
            new PokemonInfo("ゼニガメ", "みず", 44, 48),
            new PokemonInfo("カイリュー", "ドラゴン", 91, 134),
            new PokemonInfo("ミュウツー", "エスパー", 106, 110)
        );
        
        // タイプで絞り込み
        System.out.println("【でんきタイプのポケモン】");
        pokemonList.stream()
                  .filter(p -> p.type.equals("でんき"))
                  .forEach(System.out::println);
        
        // 攻撃力でソート
        System.out.println("\n【攻撃力順ポケモン】");
        pokemonList.stream()
                  .sorted((p1, p2) -> p2.attack - p1.attack)
                  .forEach(p -> System.out.println(p.name + ": 攻撃力" + p.attack));
        
        // 平均HPの計算
        double avgHP = pokemonList.stream()
                                 .mapToInt(p -> p.hp)
                                 .average()
                                 .orElse(0);
        System.out.println("\n全ポケモンの平均HP: " + avgHP);
        
        // HPが平均以上のポケモンのリスト
        List<String> strongPokemon = pokemonList.stream()
                                             .filter(p -> p.hp >= avgHP)
                                             .map(p -> p.name)
                                             .collect(Collectors.toList());
        System.out.println("\n【HPが平均以上のポケモン】");
        System.out.println(String.join(", ", strongPokemon));
    }
}
```

## 6. まとめ

ポケモンプログラムを通じて、for文と拡張for文の違いを学びました。

### for文を使うべき場面
- インデックスが必要な場合
- 配列やコレクションの要素を変更したい場合
- 複数の配列を同時に処理したい場合
- ループの一部をスキップしたり、途中で終了したりする必要がある場合

### 拡張for文を使うべき場面
- 単純に全要素に対して同じ処理を行いたい場合
- コードを簡潔に書きたい場合
- コレクションの内容を読み取るだけの場合

### 2重ループを避けるテクニック
- マップなどのデータ構造を活用する
- 適切なデータ構造を選択する
- Stream APIを活用する（Java 8以降）

この記事を参考に、株式会社ポケモンや任天堂株式会社に就職する準備をしていきましょう！
